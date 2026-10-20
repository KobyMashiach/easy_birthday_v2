import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy_birthday/features/event/data/datasources/event_remote_data_source.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/settings/data/datasources/app_settings_local_data_source.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/settings/domain/repositories/settings_repository.dart';
import 'package:easy_birthday/features/user/data/datasources/user_local_data_source.dart';
import 'package:easy_birthday/features/user/data/datasources/user_remote_data_source.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';
import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_local_data_source.dart';
import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_phone_data_source.dart';
import 'package:easy_birthday/features/wear_os/data/models/phone_login_reply.dart';
import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// Collects every state [bloc] emits while [act] runs.
Future<List<S>> emittedStates<S>(BlocBase<S> bloc, void Function() act) async {
  final states = <S>[];
  final sub = bloc.stream.listen(states.add);
  act();
  await pumpEventQueue();
  await sub.cancel();
  return states;
}

/// In-memory [EventRepository] that keeps the session's event up to date the
/// way the real one does, and logs every write in [log] (in call order).
class FakeEventRepository implements EventRepository {
  final List<String> log = [];
  final List<CategoryModel> updatedCategories = [];
  final List<EventModel> updatedEvents = [];

  /// Remote events by id ([getEvent] returns null for a missing one).
  final Map<String, EventModel> events = {};

  /// Uploads of files whose path contains this text fail.
  String failUploadsContaining = '\u0000';
  Object? updateError;
  Object? getEventError;
  int createEventCalls = 0;

  SessionService get _session => SessionService();

  @override
  Future<EventModel?> getEvent([String? eventId]) async {
    if (getEventError != null) throw getEventError!;
    return events[eventId ?? _session.user.eventId];
  }

  @override
  Stream<EventModel?> watchEvent(String eventId) => const Stream.empty();

  @override
  Future<void> createEvent() async {
    createEventCalls++;
    log.add('createEvent');
  }

  @override
  Future<void> updateEvent(EventModel event) async {
    if (updateError != null) throw updateError!;
    _session.event = event;
    updatedEvents.add(event);
    log.add('updateEvent');
  }

  @override
  Future<void> updatePlan(EventModel event, PlanModel plan) async {
    if (updateError != null) throw updateError!;
    final updated = (_session.event ?? event).copyWith(planSubscribe: plan);
    _session.event = updated;
    updatedEvents.add(updated);
    log.add('updatePlan');
  }

  @override
  Future<CategoryModel> addCategory(CategoryModel category) async {
    final added = category.copyWith(id: 'new-${category.name}');
    _session.event = _session.event!.copyWith(
      categories: [..._session.event!.categories, added],
    );
    log.add('add:${added.id}');
    return added;
  }

  @override
  Future<CategoryModel> updateCategory(
    String id,
    CategoryModel Function(CategoryModel latest) change,
  ) async {
    if (updateError != null) throw updateError!;
    final latest =
        _session.event!.categories.where((c) => c.id == id).firstOrNull ??
        (throw const AppException(AppErrorType.notFound));
    final category = change(latest);
    _session.event = _session.event!.copyWith(
      categories: [
        for (final c in _session.event!.categories) c.id == id ? category : c,
      ],
    );
    updatedCategories.add(category);
    log.add('update:$id');
    return category;
  }

  @override
  Future<void> deleteCategory(CategoryModel category) async {
    _session.event = _session.event!.copyWith(
      categories: _session.event!.categories
          .where((c) => c.id != category.id)
          .toList(),
    );
    log.add('deleteCategory:${category.id}');
  }

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
  }) async {
    if (file.path.contains(failUploadsContaining)) {
      log.add('uploadFailed:${file.path}');
      throw const AppException(AppErrorType.unknown);
    }
    log.add('upload:${file.path}');
    return 'https://cdn/$folder${file.path}';
  }

  @override
  Future<void> deleteMedia(String url) async => log.add('deleteMedia:$url');
}

/// In-memory [UserRepository] backed by [remote]; mirrors the session side
/// effects of the real repository.
class FakeUserRepository implements UserRepository {
  final Map<String, PersonaModel> remote = {};
  final List<String> log = [];
  Object? saveUserError;
  Object? registerOwnerError;

  SessionService get _session => SessionService();

  @override
  PersonaModel getLocalUser() => _session.user;

  @override
  PersonaModel? getLocalPartner() => _session.partner;

  @override
  Future<PersonaModel> getUser(String phoneNumber) async {
    final user = remote[phoneNumber];
    if (user == null) throw const AppException(AppErrorType.notFound);
    return user;
  }

  @override
  Future<bool> userExists(String phoneNumber) async =>
      remote.containsKey(phoneNumber);

  @override
  Future<void> registerOwner({
    required String phoneNumber,
    required String password,
  }) async {
    if (registerOwnerError != null) throw registerOwnerError!;
    log.add('registerOwner:$phoneNumber');
  }

  @override
  Future<void> saveUser(PersonaModel user) async {
    if (saveUserError != null) throw saveUserError!;
    _session.user = user;
    log.add('saveUser:${user.phoneNumber}');
  }

  @override
  Future<void> createPartner(PersonaModel partner) async {
    _session.partner = partner;
    log.add('createPartner:${partner.phoneNumber}');
  }

  @override
  Future<void> savePartner(PersonaModel partner) async {
    _session.partner = partner;
    log.add('savePartner:${partner.phoneNumber}');
  }
}

class FakeAuthRepository implements AuthRepository {
  final List<String> log = [];
  Object? sendOtpError;
  Object? verifyOtpError;
  Object? logoutError;
  Object? deleteAccountError;

  /// Accounts for [loginWithPassword]: phone -> (persona, plain password).
  final Map<String, (PersonaModel, String)> accounts = {};

  /// What [sendOtp] returns; null = verified instantly (Android).
  String? verificationId = 'verification-id';

  @override
  Future<String?> sendOtp(String phoneNumber) async {
    if (sendOtpError != null) throw sendOtpError!;
    log.add('sendOtp:$phoneNumber');
    return verificationId;
  }

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    if (verifyOtpError != null) throw verifyOtpError!;
    log.add('verifyOtp:$smsCode');
  }

  @override
  Future<PersonaModel> loginWithPassword({
    required String phoneNumber,
    required String password,
  }) async {
    final account = accounts[phoneNumber];
    if (account == null) throw const AppException(AppErrorType.notFound);
    if (account.$2 != password) {
      throw const AppException(AppErrorType.wrongPassword);
    }
    return account.$1;
  }

  @override
  Future<void> logout() async {
    log.add('logout');
    if (logoutError != null) throw logoutError!;
  }

  @override
  Future<void> deleteAccount() async {
    log.add('deleteAccount');
    if (deleteAccountError != null) throw deleteAccountError!;
  }
}

class FakeSettingsRepository implements SettingsRepository {
  final List<AppSettingsModel> saved = [];
  Object? saveError;

  @override
  AppSettingsModel getAppSettings() => SessionService().appSettings;

  @override
  Future<void> saveAppSettings(AppSettingsModel settings) async {
    if (saveError != null) throw saveError!;
    SessionService().appSettings = settings;
    saved.add(settings);
  }
}

// Data source fakes, for testing the real repositories.

/// In-memory Firestore/Storage for events; [updates] logs each partial write.
class FakeEventRemote implements EventRemoteDataSource {
  final Map<String, Map<String, dynamic>> events = {};
  final List<Map<String, dynamic>> updates = [];

  /// Thrown by [createEvent] and [updateEvent] when set.
  Object? writeError;

  @override
  Future<void> createEvent(String eventId, Map<String, dynamic> data) async {
    if (writeError != null) throw writeError!;
    events[eventId] = data;
  }

  @override
  Future<void> deleteEvent(String eventId) async => events.remove(eventId);
  @override
  Future<void> deleteMediaByUrl(String url) async {}
  @override
  Future<void> deleteMediaFolder(String folder) async {}
  @override
  Future<Map<String, dynamic>?> getEvent(String eventId) async =>
      events[eventId];
  @override
  Future<void> updateEvent(String eventId, Map<String, dynamic> data) async {
    if (writeError != null) throw writeError!;
    updates.add(data);
  }

  /// Like a Firestore transaction: [change] sees the latest stored
  /// categories; the write is logged in [updates] and stored in [events].
  @override
  Future<List<Map<String, dynamic>>?> updateCategories(
    String eventId,
    List<Map<String, dynamic>>? Function(List<Map<String, dynamic>> latest)
    change,
  ) async {
    if (writeError != null) throw writeError!;
    final data =
        events[eventId] ?? (throw const AppException(AppErrorType.notFound));
    final categories = change(categoriesFromJson(data['categories']));
    if (categories == null) return null;
    updates.add({'categories': categories});
    events[eventId] = {...data, 'categories': categories};
    return categories;
  }

  @override
  Future<String> uploadMedia({
    required String folder,
    required String fileName,
    required File file,
  }) async => 'https://example/$folder/$fileName';
  @override
  Stream<Map<String, dynamic>?> watchEvent(String eventId) =>
      const Stream.empty();
}

class FakeUserRemote implements UserRemoteDataSource {
  final Map<String, Map<String, dynamic>> users = {};
  final List<String> writes = [];
  @override
  Future<void> createUser(String phone, Map<String, dynamic> data) async {
    writes.add('create:$phone');
    users[phone] = data;
  }

  @override
  Future<void> deleteUser(String phone) async => users.remove(phone);
  @override
  Future<Map<String, dynamic>?> getUser(String phone) async => users[phone];
  @override
  Future<void> updateUser(String phone, Map<String, dynamic> data) async {
    writes.add('update:$phone');
    users[phone] = data;
  }

  @override
  Future<bool> userExists(String phone) async => users.containsKey(phone);
}

class FakeAuthRemote implements AuthRemoteDataSource {
  @override
  Future<void> deleteCurrentUser() async {}
  @override
  Future<String> sendOtp(String phoneNumber) async => 'verification-id';
  @override
  Future<void> signOut() async {}
  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {}
}

class FakeUserLocal implements UserLocalDataSource {
  PersonaModel? user;
  PersonaModel? partner;
  @override
  PersonaModel? getUser() => user;
  @override
  Future<void> saveUser(PersonaModel user) async => this.user = user;
  @override
  PersonaModel? getPartner() => partner;
  @override
  Future<void> savePartner(PersonaModel partner) async =>
      this.partner = partner;
}

class FakeSettingsLocal implements AppSettingsLocalDataSource {
  AppSettingsModel? settings;
  @override
  AppSettingsModel? getAppSettings() => settings;
  @override
  Future<void> saveAppSettings(AppSettingsModel settings) async =>
      this.settings = settings;
}

class FakeWearOsLocal implements WearOsLocalDataSource {
  String? eventId;
  @override
  String? getSavedEventId() => eventId;
  @override
  Future<void> saveEventId(String eventId) async => this.eventId = eventId;
  @override
  Future<void> clearEventId() async => eventId = null;
}

class FakeWearOsRepository implements WearOsRepository {
  String? eventId;
  final StreamController<PhoneLoginReply> replies =
      StreamController<PhoneLoginReply>.broadcast();
  int loginRequests = 0;
  @override
  String? getSavedEventId() => eventId;
  @override
  Future<void> saveEventId(String eventId) async => this.eventId = eventId;
  @override
  Future<void> clearEventId() async => eventId = null;
  @override
  Stream<PhoneLoginReply> watchPhoneLoginReplies() => replies.stream;
  @override
  Future<void> sendPhoneLoginRequest() async => loginRequests++;
}

/// The phone side of the watch connection: [sent] logs what the watch sent,
/// [reply] delivers a message from the phone.
class FakeWearOsPhone implements WearOsPhoneDataSource {
  final List<String> sent = [];
  final StreamController<Map<String, dynamic>> _messages =
      StreamController<Map<String, dynamic>>.broadcast();

  /// Thrown by [sendLoginRequest] when set.
  Object? sendError;

  /// Called after a login request was sent (e.g. to answer right away).
  void Function()? onSent;

  void reply(Map<String, dynamic> message) => _messages.add(message);

  @override
  Stream<Map<String, dynamic>> get loginResponses => _messages.stream;

  @override
  Future<void> sendLoginRequest() async {
    if (sendError != null) throw sendError!;
    sent.add('/start_login');
    onSent?.call();
  }
}
