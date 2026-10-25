import 'dart:io';

import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';

/// The shared event of the owner and partner, kept in `SessionService.event`.
///
/// Every write puts the new event in the session before writing it (screens
/// read the session right away) and restores the previous one if the write
/// fails, then rethrows.
abstract class EventRepository {
  /// The event of [eventId], or of the signed-in user when omitted; null when
  /// there is no such event. Doesn't touch the session.
  Future<EventModel?> getEvent([String? eventId]);

  /// Live updates of the event; each one also replaces the session's event.
  Stream<EventModel?> watchEvent(String eventId);

  /// Creates the shared event for the session's user and partner (first
  /// registration). Without an event id yet, a new one is set on the session
  /// user and partner only: the caller persists both personas.
  Future<void> createEvent();

  /// Writes every field of [event] except `categories` (the session keeps
  /// its current categories).
  Future<void> updateEvent(EventModel event);

  /// Writes only the event's plan (purchases), so nothing else the owner or
  /// partner changed meanwhile can be overwritten.
  Future<void> updatePlan(EventModel event, PlanModel plan);

  /// Writes only the event's children (settings), for the same reason.
  Future<void> updateChildren(List<ChildModel> children);

  /// These change one category on the latest server copy of the event's
  /// `categories` (atomically), so the owner's and the partner's concurrent
  /// edits of different categories both survive.
  Future<CategoryModel> addCategory(CategoryModel category);

  /// Applies [change] to the latest copy of the category [id]: first to the
  /// session's copy, then to the server's inside the transaction, so
  /// concurrent edits of other fields of the same category survive too.
  /// [change] may run several times (transaction retries) and must only set
  /// the fields its caller edits. Returns the category as written. Throws
  /// `AppException(notFound)` when the category no longer exists.
  Future<CategoryModel> updateCategory(
    String id,
    CategoryModel Function(CategoryModel latest) change,
  );
  Future<void> deleteCategory(CategoryModel category);

  /// Puts the categories in the order of [ids]; any category missing from
  /// [ids] (e.g. just added on the other phone) keeps its place after them.
  Future<void> reorderCategories(List<String> ids);

  /// The category as it is now in the session's event (it may have changed
  /// since a screen captured it).
  CategoryModel currentCategory(CategoryModel category);

  /// Compresses and uploads [file] into [folder]; returns its download URL.
  /// Uploads [file] into [folder]; [fileName] overwrites a fixed object
  /// (e.g. the profile image), otherwise a random name is used.
  Future<String> uploadMedia({
    required String folder,
    required File file,
    String? fileName,
  });

  /// Best effort: a failure is logged, never thrown.
  Future<void> deleteMedia(String url);
}
