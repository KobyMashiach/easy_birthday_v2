import 'dart:async';
import 'dart:io';

import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/encryption_service.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/slang_settings.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:easy_birthday/features/event/data/datasources/event_remote_data_source.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/option_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/data/models/question_model.dart';
import 'package:easy_birthday/features/event/data/repositories_impl/event_repository_impl.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/settings/data/models/app_settings_model.dart';
import 'package:easy_birthday/features/settings/data/repositories_impl/settings_repository_impl.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/data/repositories_impl/user_repository_impl.dart';
import 'package:easy_birthday/features/wear_os/data/models/phone_login_reply.dart';
import 'package:easy_birthday/features/wear_os/data/repositories_impl/wear_os_repository_impl.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

PersonaModel _persona(String phone, {String gender = 'male'}) => PersonaModel(
  name: 'Name $phone',
  phoneNumber: phone,
  password: 'pw',
  role: RoleModel.partner,
  registerComplete: false,
  gender: gender,
);

const _text = CategoryModel(
  categoryType: CategoryEnum.text,
  name: 'Text',
  description: '',
);

void main() {
  setUp(SessionService().reset);

  group('EventRepositoryImpl', () {
    late FakeEventRemote remote;
    late EventRepositoryImpl repository;

    setUp(() {
      remote = FakeEventRemote();
      repository = EventRepositoryImpl(remoteDataSource: remote);
      SessionService().event = EventModel(
        eventId: 'e1',
        users: const ['1', '2'],
        planSubscribe: getPlan(PlansEnum.free),
      );
      remote.events['e1'] = SessionService().event!.toJson();
    });

    List<String> remoteNames() => [
      for (final json in categoriesFromJson(remote.events['e1']!['categories']))
        CategoryModel.fromJson(json).name,
    ];

    Matcher throwsNotFound() => throwsA(
      isA<AppException>().having((e) => e.type, 'type', AppErrorType.notFound),
    );

    test(
      'addCategory assigns an id and writes only the categories field',
      () async {
        final added = await repository.addCategory(_text);
        expect(added.id, isNotNull);
        expect(SessionService().event!.categories, [added]);
        expect(remote.updates.single.keys, ['categories']);
      },
    );

    test('updateCategory replaces by id; deleteCategory removes it', () async {
      final added = await repository.addCategory(_text);
      await repository.updateCategory(
        added.id!,
        (c) => c.copyWith(name: 'Renamed'),
      );
      expect(SessionService().event!.categories.single.name, 'Renamed');
      await repository.deleteCategory(added);
      expect(SessionService().event!.categories, isEmpty);
    });

    test(
      'two writers editing different categories both survive (each write '
      'applies to the latest server copy)',
      () async {
        final a = await repository.addCategory(_text.copyWith(name: 'A'));
        final b = await repository.addCategory(_text.copyWith(name: 'B'));
        // The other phone adds C; this phone's session hasn't seen it yet.
        final other = EventRepositoryImpl(remoteDataSource: remote);
        final stale = SessionService().event;
        final c = await other.addCategory(_text.copyWith(name: 'C'));
        SessionService().event = stale;

        await Future.wait([
          repository.updateCategory(a.id!, (x) => x.copyWith(name: 'A owner')),
          other.updateCategory(b.id!, (x) => x.copyWith(name: 'B partner')),
        ]);
        await repository.deleteCategory(a);

        expect(remoteNames(), ['B partner', 'C']);
        // The session shows the other writer's edits as well.
        expect(SessionService().event!.categories.map((x) => x.id), [
          b.id,
          c.id,
        ]);
      },
    );

    test('owner uploads and partner quiz answer on the SAME category both '
        'survive (each change applies only its own fields)', () async {
      final option = OptionModel(text: 'a', isCorrect: true);
      final question = QuestionModel(text: 'Q', options: [option]);
      final quiz = await repository.addCategory(
        _text.copyWith(
          categoryType: CategoryEnum.quizGame,
          quizGame: [question],
        ),
      );
      final ownerSession = SessionService().event;
      // The partner answers on their phone; the owner's session hasn't seen it.
      final partner = EventRepositoryImpl(remoteDataSource: remote);
      await UpdateCategoryUseCase(partner)(
        quiz,
        (latest) => latest.copyWith(
          quizGame: [
            latest.quizGame!.single.copyWith(
              isLocked: true,
              selectedOption: option,
            ),
          ],
          quizGameScore: 1,
        ),
      );
      SessionService().event = ownerSession;

      await AddCategoryFilesUseCase(repository)(
        eventId: 'e1',
        category: quiz,
        files: [File('/photos/a.jpg')],
        lock: quiz.lock,
      );

      final saved = CategoryModel.fromJson(
        categoriesFromJson(remote.events['e1']!['categories']).single,
      );
      expect(saved.urls, hasLength(1));
      expect(saved.quizGameScore, 1);
      expect(saved.quizGame!.single.isLocked, isTrue);
      // The owner's session shows the partner's answer too.
      expect(SessionService().event!.categories.single.quizGameScore, 1);
    });

    test('updateCategory of a category the other one deleted throws '
        'notFound and restores the session', () async {
      final added = await repository.addCategory(_text);
      final before = SessionService().event;
      remote.events['e1'] = {...remote.events['e1']!, 'categories': []};
      remote.updates.clear();

      await expectLater(
        repository.updateCategory(
          added.id!,
          (c) => c.copyWith(name: 'Renamed'),
        ),
        throwsNotFound(),
      );
      expect(SessionService().event, same(before));
      expect(remote.updates, isEmpty);
      expect(remoteNames(), isEmpty);
    });

    test('updateCategory of an unknown id throws notFound', () async {
      await expectLater(
        repository.updateCategory('gone', (c) => c),
        throwsNotFound(),
      );
      expect(remote.updates, isEmpty);
    });

    test('updateEvent never writes the categories', () async {
      final added = await repository.addCategory(_text);
      final stale = SessionService().event!.copyWith(categories: const []);
      await repository.updateEvent(stale.copyWith(greeting: 'Hi'));
      expect(remote.updates.last.containsKey('categories'), isFalse);
      expect(remote.updates.last['greeting'], 'Hi');
      expect(SessionService().event!.greeting, 'Hi');
      expect(SessionService().event!.categories, [added]);
    });

    test('getEvent returns null for a missing event', () async {
      expect(await repository.getEvent('missing'), isNull);
    });

    test('currentCategory returns the live copy from the event', () async {
      final added = await repository.addCategory(_text);
      SessionService().event = SessionService().event!.copyWith(
        categories: [added.copyWith(name: 'New')],
      );
      expect(repository.currentCategory(added).name, 'New');
    });

    test('a failed write restores the previous session event', () async {
      final added = await repository.addCategory(_text);
      final before = SessionService().event;
      remote.writeError = const AppException(AppErrorType.unknown);

      for (final write in <Future<void> Function()>[
        () => repository.addCategory(_text),
        () => repository.updateCategory(
          added.id!,
          (c) => c.copyWith(name: 'Renamed'),
        ),
        () => repository.deleteCategory(added),
        () => repository.updateEvent(before!.copyWith(greeting: 'Hi')),
      ]) {
        await expectLater(write(), throwsA(isA<AppException>()));
        expect(SessionService().event, same(before));
      }
    });

    test('a failed write keeps a newer event set meanwhile', () async {
      final writeDone = Completer<void>();
      final slow = _SlowEventRemote(writeDone.future);
      final slowRepository = EventRepositoryImpl(remoteDataSource: slow);
      final pending = slowRepository.addCategory(_text);
      final newer = SessionService().event!.copyWith(greeting: 'snapshot');
      SessionService().event = newer;
      writeDone.completeError(const AppException(AppErrorType.unknown));
      await expectLater(pending, throwsA(isA<AppException>()));
      expect(SessionService().event, same(newer));
    });

    test('currentCategory falls back to the given category', () {
      const orphan = CategoryModel(
        id: 'x',
        categoryType: CategoryEnum.text,
        name: 'X',
        description: '',
      );
      expect(repository.currentCategory(orphan), orphan);
    });
  });

  group('AuthRepositoryImpl.loginWithPassword', () {
    late FakeUserRemote users;
    late AuthRepositoryImpl repository;

    setUp(() {
      users = FakeUserRemote();
      repository = AuthRepositoryImpl(
        authDataSource: FakeAuthRemote(),
        userDataSource: users,
        eventDataSource: FakeEventRemote(),
      );
      users.users['+972501234567'] = PersonaModel(
        name: 'Dana',
        phoneNumber: '+972501234567',
        password: MyEncryptionDecryption.encryptFernet('secret123').base64,
        role: RoleModel.owner,
        registerComplete: true,
      ).toJson();
    });

    test('returns the persona for the right password', () async {
      final persona = await repository.loginWithPassword(
        phoneNumber: '+972501234567',
        password: 'secret123',
      );
      expect(persona.name, 'Dana');
    });

    test('throws wrongPassword for a wrong password', () {
      expect(
        repository.loginWithPassword(
          phoneNumber: '+972501234567',
          password: 'nope',
        ),
        throwsA(
          isA<AppException>().having(
            (e) => e.type,
            'type',
            AppErrorType.wrongPassword,
          ),
        ),
      );
    });

    test('throws notFound for an unknown phone', () {
      expect(
        repository.loginWithPassword(phoneNumber: '+1', password: 'x'),
        throwsA(
          isA<AppException>().having(
            (e) => e.type,
            'type',
            AppErrorType.notFound,
          ),
        ),
      );
    });
  });

  group('AuthRepositoryImpl.deleteAccount', () {
    test('an owner deletes the event, the partner and themselves', () async {
      final users = FakeUserRemote();
      final events = FakeEventRemote();
      final repository = AuthRepositoryImpl(
        authDataSource: FakeAuthRemote(),
        userDataSource: users,
        eventDataSource: events,
      );
      users.users
        ..['1'] = {}
        ..['2'] = {};
      events.events['e1'] = {};
      SessionService()
        ..user = _persona('1').copyWith(role: RoleModel.owner, eventId: 'e1')
        ..partner = _persona('2');

      await repository.deleteAccount();

      expect(users.users, isEmpty);
      expect(events.events, isEmpty);
      expect(SessionService().user.phoneNumber, '');
      expect(SessionService().partner, isNull);
    });

    test('a partner deletes only their own account', () async {
      final users = FakeUserRemote();
      final events = FakeEventRemote();
      final repository = AuthRepositoryImpl(
        authDataSource: FakeAuthRemote(),
        userDataSource: users,
        eventDataSource: events,
      );
      users.users
        ..['1'] = {}
        ..['2'] = {};
      events.events['e1'] = {};
      SessionService()
        ..user = _persona('2').copyWith(eventId: 'e1')
        ..partner = _persona('1');

      await repository.deleteAccount();

      expect(users.users.keys, ['1']);
      expect(events.events.keys, ['e1']);
    });
  });

  group('UserRepositoryImpl', () {
    late FakeUserLocal local;
    late FakeUserRemote remote;
    late UserRepositoryImpl repository;

    setUp(() {
      local = FakeUserLocal();
      remote = FakeUserRemote();
      repository = UserRepositoryImpl(
        localDataSource: local,
        remoteDataSource: remote,
      );
    });

    test('getLocalUser falls back to an empty persona', () {
      expect(repository.getLocalUser().phoneNumber, '');
      local.user = _persona('1');
      expect(repository.getLocalUser().phoneNumber, '1');
    });

    test('getUser throws notFound for a missing or empty document', () async {
      remote.users['2'] = {};
      for (final phone in ['1', '2']) {
        await expectLater(
          repository.getUser(phone),
          throwsA(
            isA<AppException>().having(
              (e) => e.type,
              'type',
              AppErrorType.notFound,
            ),
          ),
        );
      }
      remote.users['3'] = _persona('3').toJson();
      expect((await repository.getUser('3')).name, 'Name 3');
    });

    test(
      'registerOwner saves an owner locally, in session and remotely',
      () async {
        await repository.registerOwner(phoneNumber: '1', password: 'enc');
        expect(local.user!.role, RoleModel.owner);
        expect(local.user!.password, 'enc');
        expect(SessionService().user, local.user);
        expect(remote.writes, ['create:1']);
        expect(remote.users['1']!['role'], 'owner');
      },
    );

    test(
      'saveUser updates session/gender and only an existing remote doc',
      () async {
        await repository.saveUser(_persona('1', gender: 'female'));
        expect(local.user!.phoneNumber, '1');
        expect(SessionService().user.phoneNumber, '1');
        expect(SessionService().gender, GenderContext.female);
        expect(remote.writes, isEmpty);

        remote.users['1'] = {};
        await repository.saveUser(_persona('1'));
        expect(SessionService().gender, GenderContext.male);
        expect(remote.writes, ['update:1']);
      },
    );

    test('createPartner creates the remote doc only when missing', () async {
      await repository.createPartner(_persona('2'));
      expect(remote.writes, ['create:2']);
      expect(SessionService().partner!.phoneNumber, '2');
      expect(local.partner!.phoneNumber, '2');

      await repository.createPartner(_persona('2'));
      expect(remote.writes, ['create:2']);
    });

    test('savePartner never creates a remote doc', () async {
      await repository.savePartner(_persona('2'));
      expect(remote.writes, isEmpty);
      expect(SessionService().partner!.phoneNumber, '2');

      remote.users['2'] = {};
      await repository.savePartner(_persona('2'));
      expect(remote.writes, ['update:2']);
    });
  });

  group('SettingsRepositoryImpl', () {
    test('defaults until saved; save updates local and session', () async {
      final local = FakeSettingsLocal();
      final repository = SettingsRepositoryImpl(localDataSource: local);
      // Nothing saved: the device language (Hebrew when unsupported).
      expect(repository.getAppSettings().languageCode, defaultLanguageCode());

      final settings = AppSettingsModel(
        appColor: const Color(0xFF123456),
        languageCode: 'en',
      );
      await repository.saveAppSettings(settings);
      expect(local.settings, settings);
      expect(SessionService().appSettings, settings);
      expect(repository.getAppSettings(), settings);
    });
  });

  group('WearOsRepositoryImpl', () {
    test('saves, reads and clears the watch event id', () async {
      final local = FakeWearOsLocal();
      final repository = WearOsRepositoryImpl(localDataSource: local);
      expect(repository.getSavedEventId(), isNull);
      await repository.saveEventId('e1');
      expect(repository.getSavedEventId(), 'e1');
      await repository.clearEventId();
      expect(repository.getSavedEventId(), isNull);
    });

    test('sends the login request and maps the phone replies', () async {
      final phone = FakeWearOsPhone();
      final repository = WearOsRepositoryImpl(
        localDataSource: FakeWearOsLocal(),
        phoneDataSource: phone,
      );
      final replies = <PhoneLoginReply>[];
      final sub = repository.watchPhoneLoginReplies().listen(replies.add);

      await repository.sendPhoneLoginRequest();
      phone
        ..reply({
          'path': '/login_response',
          'status': 'success',
          'eventId': 'e1',
        })
        ..reply({'path': '/login_response', 'status': 'partner'})
        ..reply({'path': '/login_response', 'status': 'failed'})
        // Never sent by the phone: nothing to open, so it counts as failed.
        ..reply({'path': '/login_response', 'status': 'success'});
      await pumpEventQueue();
      await sub.cancel();

      expect(phone.sent, ['/start_login']);
      expect(
        [for (final r in replies) (r.status, r.eventId)],
        [
          (PhoneLoginStatus.success, 'e1'),
          (PhoneLoginStatus.partner, null),
          (PhoneLoginStatus.failed, null),
          (PhoneLoginStatus.failed, null),
        ],
      );
    });
  });
}

/// Holds every event write until [done] completes.
class _SlowEventRemote extends FakeEventRemote {
  final Future<void> done;
  _SlowEventRemote(this.done);

  @override
  Future<void> updateEvent(String eventId, Map<String, dynamic> data) => done;

  @override
  Future<List<Map<String, dynamic>>?> updateCategories(
    String eventId,
    List<Map<String, dynamic>>? Function(List<Map<String, dynamic>> latest)
    change,
  ) async {
    await done;
    return super.updateCategories(eventId, change);
  }
}
