import 'dart:developer';
import 'dart:io';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/features/event/data/datasources/event_remote_data_source.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/event_converters_json.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;

  EventRepositoryImpl({required this.remoteDataSource});

  SessionService get _session => SessionService();

  EventModel get _event =>
      _session.event ??
      (throw const AppException(
        AppErrorType.notFound,
        message: 'No event loaded',
      ));

  @override
  Future<EventModel?> getEvent([String? eventId]) async {
    final id = eventId ?? _session.user.eventId;
    if (id == null) return null;
    final data = await remoteDataSource.getEvent(id);
    if (data == null || data.isEmpty) return null;
    return EventModel.fromJson(data);
  }

  @override
  Stream<EventModel?> watchEvent(String eventId) =>
      remoteDataSource.watchEvent(eventId).map((data) {
        if (data == null) return null;
        final event = EventModel.fromJson(data);
        _session.event = event;
        return event;
      });

  @override
  Future<void> createEvent() async {
    final partner =
        _session.partner ??
        (throw const AppException(
          AppErrorType.notFound,
          message: 'No partner to create the event with',
        ));
    String? eventId = _session.user.eventId;
    if (eventId == null) {
      eventId = getRandomString(15);
      _session.user = _session.user.copyWith(eventId: eventId);
      _session.partner = partner.copyWith(eventId: eventId);
    }
    final event = EventModel(
      eventId: eventId,
      users: [_session.user.phoneNumber, partner.phoneNumber],
      planSubscribe: getPlan(PlansEnum.free),
    );
    await _writeOptimistically(
      event,
      () => remoteDataSource.createEvent(event.eventId, event.toJson()),
    );
  }

  /// Writes every field but `categories`: those change only through the
  /// category methods (atomically), so a stale copy here can't undo the
  /// other one's category edits.
  @override
  Future<void> updateEvent(EventModel event) {
    final current = _session.event;
    final withLiveCategories = current?.eventId == event.eventId
        ? event.copyWith(categories: current!.categories)
        : event;
    return _writeOptimistically(
      withLiveCategories,
      () => remoteDataSource.updateEvent(
        event.eventId,
        event.toJson()..remove('categories'),
      ),
    );
  }

  @override
  Future<void> updatePlan(EventModel event, PlanModel plan) {
    final current = _session.event;
    final base = current?.eventId == event.eventId ? current! : event;
    return _writeOptimistically(
      base.copyWith(planSubscribe: plan),
      () => remoteDataSource.updateEvent(event.eventId, {
        'planSubscribe': const PlanConverter().toJson(plan),
      }),
    );
  }

  @override
  Future<void> updateChildren(List<ChildModel> children) {
    final EventModel event = _event;
    return _writeOptimistically(
      event.copyWith(children: children),
      () => remoteDataSource.updateEvent(event.eventId, {
        'children': [
          for (final child in children) const ChildConverter().toJson(child),
        ],
      }),
    );
  }

  @override
  Future<CategoryModel> addCategory(CategoryModel category) async {
    final newCategory = category.copyWith(id: getRandomString(10));
    await _changeCategories((categories) => [...categories, newCategory]);
    return newCategory;
  }

  @override
  Future<CategoryModel> updateCategory(
    String id,
    CategoryModel Function(CategoryModel latest) change,
  ) async {
    // The last run of [change] is the one on the server's copy: the written one.
    late CategoryModel written;
    await _changeCategories((categories) {
      final index = categories.indexWhere((c) => c.id == id);
      if (index == -1) return null;
      written = change(categories[index]).copyWith(id: id);
      return [...categories]..[index] = written;
    });
    return written;
  }

  @override
  Future<void> deleteCategory(CategoryModel category) => _changeCategories(
    (categories) => [
      for (final c in categories)
        if (c.id != category.id) c,
    ],
  );

  @override
  Future<void> reorderCategories(List<String> ids) =>
      _changeCategories((categories) => orderCategories(categories, ids));

  @override
  CategoryModel currentCategory(CategoryModel category) =>
      _session.event?.categories
          .where((c) => c.id == category.id)
          .firstOrNull ??
      category;

  @override
  Future<String> uploadMedia({
    required String folder,
    required File file,
    String? fileName,
  }) => remoteDataSource.uploadMedia(
    folder: folder,
    fileName: fileName ?? getRandomString(8),
    file: file,
  );

  @override
  Future<void> deleteMedia(String url) async {
    try {
      await remoteDataSource.deleteMediaByUrl(url);
    } catch (e) {
      log('Could not delete media $url: $e');
    }
  }

  /// Applies [change] to the session's categories right away, then to the
  /// latest server copy in a transaction, so the owner's and the partner's
  /// concurrent edits of different categories both survive. [change] returns
  /// null when the category it edits is gone (deleted by the other one):
  /// that throws `AppException(notFound)`.
  Future<void> _changeCategories(
    List<CategoryModel>? Function(List<CategoryModel> categories) change,
  ) async {
    final event = _event;
    final optimistic = event.copyWith(
      categories: change(event.categories) ?? (throw _categoryNotFound),
    );
    await _writeOptimistically(optimistic, () async {
      List<CategoryModel>? merged;
      final written = await remoteDataSource.updateCategories(event.eventId, (
        latest,
      ) {
        merged = change([
          for (final json in latest) CategoryModel.fromJson(json),
        ]);
        return merged?.map((c) => c.toJson()).toList();
      });
      if (written == null) throw _categoryNotFound;
      // Show the other one's edits too until their snapshot arrives.
      if (identical(_session.event, optimistic)) {
        _session.event = optimistic.copyWith(categories: merged!);
      }
    });
  }

  static const _categoryNotFound = AppException(
    AppErrorType.notFound,
    message: 'Category not found',
  );

  /// Puts [event] in the session before [write] runs (screens read it right
  /// away) and restores the previous event if the write fails, unless a newer
  /// event (another write, a snapshot) replaced it meanwhile.
  Future<void> _writeOptimistically(
    EventModel event,
    Future<void> Function() write,
  ) async {
    final previous = _session.event;
    _session.event = event;
    try {
      await write();
    } catch (_) {
      if (identical(_session.event, event)) _session.event = previous;
      rethrow;
    }
  }
}

/// [categories] in the order of [ids], then the ones [ids] doesn't name, in
/// their current order.
List<CategoryModel> orderCategories(
  List<CategoryModel> categories,
  List<String> ids,
) {
  final Map<String?, CategoryModel> byId = {
    for (final category in categories) category.id: category,
  };
  return [
    for (final id in ids) ?byId[id],
    for (final category in categories)
      if (!ids.contains(category.id)) category,
  ];
}
