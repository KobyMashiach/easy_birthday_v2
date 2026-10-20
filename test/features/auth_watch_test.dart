import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/auth/domain/usecases/login_with_password_usecase.dart';
import 'package:easy_birthday/features/auth/presentation/bloc/login_bloc.dart'
    as login;
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:easy_birthday/features/auth/presentation/bloc/register_bloc.dart'
    as register;
import 'package:easy_birthday/features/settings/presentation/bloc/change_password_bloc.dart'
    as change_password;
import 'package:easy_birthday/features/user/domain/usecases/register_owner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/user_exists_usecase.dart';
import 'package:easy_birthday/features/event/data/models/category_enum.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/clear_event_id_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/save_event_id_usecase.dart';
import 'package:easy_birthday/features/wear_os/presentation/bloc/wear_os_categories_bloc.dart'
    as wear;
import 'package:easy_birthday/features/wear_os/data/repositories_impl/wear_os_repository_impl.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/send_phone_login_request_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/watch_phone_login_replies_usecase.dart';
import 'package:easy_birthday/features/wear_os/presentation/bloc/wear_os_login_bloc.dart'
    as wear_login;
import 'package:easy_birthday/features/wear_os/presentation/watch_login_listener.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

const _phone = '+972500000001';

final _owner = PersonaModel(
  name: 'Owner',
  phoneNumber: _phone,
  password: '',
  role: RoleModel.owner,
  registerComplete: true,
);

void main() {
  late FakeUserRepository users;
  late FakeAuthRepository auth;

  setUp(() {
    SessionService().reset();
    users = FakeUserRepository();
    auth = FakeAuthRepository();
  });

  group('WatchLoginListener', () {
    late StreamController<Map<String, dynamic>> messages;
    late List<Map<String, dynamic>> sent;
    late List<void Function(bool, bool)> opened;
    String? eventId;
    late WatchLoginListener listener;

    setUp(() {
      messages = StreamController<Map<String, dynamic>>.broadcast();
      sent = [];
      opened = [];
      eventId = 'e1';
      listener = WatchLoginListener(
        messages: messages.stream,
        sendMessage: (message) async => sent.add(message),
        openLogin: opened.add,
        currentEventId: () => eventId,
      );
    });
    tearDown(() async {
      await listener.stop();
      await messages.close();
    });

    test('opens the login once per request, even if started twice', () async {
      listener
        ..start()
        ..start();
      messages
        ..add({'path': '/other'})
        ..add({'path': '/start_login'});
      await pumpEventQueue();
      expect(opened, hasLength(1));
    });

    test('replies success/partner/failed, failed without an event', () async {
      listener.start();
      messages.add({'path': '/start_login'});
      await pumpEventQueue();
      final reply = opened.single;

      reply(true, true);
      reply(true, false);
      reply(false, false);
      eventId = null;
      reply(true, true);
      await pumpEventQueue();

      expect(sent, [
        {'path': '/login_response', 'status': 'success', 'eventId': 'e1'},
        {'path': '/login_response', 'status': 'partner'},
        {'path': '/login_response', 'status': 'failed'},
        {'path': '/login_response', 'status': 'failed'},
      ]);
    });

    test('a phone already signed in as an owner with an event replies '
        'success without opening the login', () async {
      SessionService()
        ..user = _owner.copyWith(eventId: 'e1')
        ..event = EventModel(
          eventId: 'e1',
          users: const [_phone],
          planSubscribe: getPlan(PlansEnum.free),
        );
      listener.start();
      messages.add({'path': '/start_login'});
      await pumpEventQueue();
      expect(opened, isEmpty);
      expect(sent, [
        {'path': '/login_response', 'status': 'success', 'eventId': 'e1'},
      ]);
    });

    test(
      'a signed-in partner or an owner without an event opens the login',
      () async {
        listener.start();
        SessionService().user = _owner;
        messages.add({'path': '/start_login'});
        SessionService()
          ..user = _owner.copyWith(role: RoleModel.partner)
          ..event = EventModel(
            eventId: 'e1',
            users: const [_phone],
            planSubscribe: getPlan(PlansEnum.free),
          );
        await pumpEventQueue();
        messages.add({'path': '/start_login'});
        await pumpEventQueue();
        expect(opened, hasLength(2));
        expect(sent, isEmpty);
      },
    );

    test('stop ends listening', () async {
      listener.start();
      await listener.stop();
      messages.add({'path': '/start_login'});
      await pumpEventQueue();
      expect(opened, isEmpty);
    });
  });

  group('RegisterBloc', () {
    late register.RegisterBloc bloc;

    setUp(() {
      bloc = register.RegisterBloc(
        userExistsUseCase: UserExistsUseCase(users),
        sendOtpUseCase: SendOtpUseCase(auth),
        verifyOtpUseCase: VerifyOtpUseCase(auth),
        registerOwnerUseCase: RegisterOwnerUseCase(users),
      );
    });
    tearDown(() => bloc.close());

    test('sendCode opens the code page', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .sendCode(phoneNumber: _phone, password: 'pw')),
      );
      expect(states.last, isA<register.NavigateToOtp>());
      expect(users.log, isEmpty);
    });

    test('a second OK on the code page while verifying is ignored', () async {
      const verify = register.RegisterEvent.verifyOtp(
        verificationId: 'v1',
        otpCode: '123456',
        phoneNumber: _phone,
        password: 'pw',
      );
      await emittedStates(
        bloc,
        () => bloc
          ..add(verify)
          ..add(verify),
      );
      expect(auth.log, ['verifyOtp:123456']);
      expect(users.log, ['registerOwner:$_phone']);
    });

    test('retrying after a failed registration skips the used code', () async {
      const verify = register.RegisterEvent.verifyOtp(
        verificationId: 'v1',
        otpCode: '123456',
        phoneNumber: _phone,
        password: 'pw',
      );
      users.registerOwnerError = Exception('offline');
      final failed = await emittedStates(bloc, () => bloc.add(verify));
      expect(failed.last, isA<register.ErrorMessage>());

      users.registerOwnerError = null;
      auth.verifyOtpError = Exception('code already used');
      final retried = await emittedStates(bloc, () => bloc.add(verify));
      expect(retried.last, isA<register.NavigateToOnboarding>());
      expect(auth.log, ['verifyOtp:123456']);
    });

    test('sendCode verified instantly registers and continues', () async {
      auth.verificationId = null;
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .sendCode(phoneNumber: _phone, password: 'pw')),
      );
      expect(states.whereType<register.NavigateToOtp>(), isEmpty);
      expect(states.last, isA<register.NavigateToOnboarding>());
      expect(users.log, ['registerOwner:$_phone']);
    });
  });

  group('LoginBloc', () {
    late login.LoginBloc bloc;
    late FakeEventRepository events;

    setUp(() {
      final settings = FakeSettingsRepository();
      events = FakeEventRepository();
      bloc = login.LoginBloc(
        sendOtpUseCase: SendOtpUseCase(auth),
        verifyOtpUseCase: VerifyOtpUseCase(auth),
        loginWithPasswordUseCase: LoginWithPasswordUseCase(auth),
        userExistsUseCase: UserExistsUseCase(users),
        getUserUseCase: GetUserUseCase(users),
        saveUserUseCase: SaveUserUseCase(users),
        createPartnerUseCase: CreatePartnerUseCase(users),
        getEventUseCase: GetEventUseCase(events),
        saveAppSettingsUseCase: SaveAppSettingsUseCase(settings),
      );
      users.remote[_phone] = _owner;
      auth.accounts[_phone] = (_owner, 'secret');
    });
    tearDown(() => bloc.close());

    test('a double tap on login logs in once', () async {
      const tap = login.LoginEvent.loginWithPassword(
        phoneNumber: _phone,
        password: 'secret',
        isWatch: false,
      );
      final states = await emittedStates(
        bloc,
        () => bloc
          ..add(tap)
          ..add(tap),
      );
      expect(states.whereType<login.NavigateToHome>(), hasLength(1));
      expect(users.log, ['saveUser:$_phone']);
    });

    test('a second OK on the code page while verifying is ignored', () async {
      const verify = login.LoginEvent.verifyOtp(
        verificationId: 'v1',
        otpCode: '123456',
        phoneNumber: _phone,
        isWatch: false,
      );
      final states = await emittedStates(
        bloc,
        () => bloc
          ..add(verify)
          ..add(verify),
      );
      expect(auth.log, ['verifyOtp:123456']);
      expect(states.whereType<login.NavigateToHome>(), hasLength(1));
    });

    test('a watch login reports to the watch and continues home', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .loginWithPassword(
            phoneNumber: _phone,
            password: 'secret',
            isWatch: true,
          ),
        ),
      );
      expect(states.map((s) => s.runtimeType), [
        login.Loading,
        login.MessageToWatch,
        login.NavigateToHome,
      ]);
      expect((states[1] as login.MessageToWatch).message, 'success');
    });

    test('a partner watch login reports partner and continues', () async {
      final partner = _owner.copyWith(role: RoleModel.partner);
      auth.accounts[_phone] = (partner, 'secret');
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .loginWithPassword(
            phoneNumber: _phone,
            password: 'secret',
            isWatch: true,
          ),
        ),
      );
      expect(
        states.whereType<login.MessageToWatch>().single.message,
        'partner',
      );
      expect(states.last, isA<login.NavigateToHome>());
    });

    test(
      'an owner whose partner deleted their account still logs in',
      () async {
        events.events['e1'] = EventModel(
          eventId: 'e1',
          users: const [_phone, '+972500000002'],
          planSubscribe: getPlan(PlansEnum.free),
        );
        auth.accounts[_phone] = (_owner.copyWith(eventId: 'e1'), 'secret');
        final states = await emittedStates(
          bloc,
          () => bloc.add(
            const .loginWithPassword(
              phoneNumber: _phone,
              password: 'secret',
              isWatch: false,
            ),
          ),
        );
        expect(states.last, isA<login.NavigateToHome>());
        expect(SessionService().event?.eventId, 'e1');
        expect(SessionService().partner, isNull);
      },
    );
  });

  group('ChangePasswordBloc', () {
    late change_password.ChangePasswordBloc bloc;

    setUp(() {
      bloc = change_password.ChangePasswordBloc(
        sendOtpUseCase: SendOtpUseCase(auth),
        verifyOtpUseCase: VerifyOtpUseCase(auth),
      );
    });
    tearDown(() => bloc.close());

    test('sendOtp verified instantly unlocks without a code page', () async {
      auth.verificationId = null;
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .sendOtp()),
      );
      expect(states.whereType<change_password.NavigateToOtp>(), isEmpty);
      expect(states.last, isA<change_password.Loaded>());
      expect(states.last.otpVerified, isTrue);
    });

    test('sendOtp then verifyOtp unlocks', () async {
      await emittedStates(bloc, () => bloc.add(const .sendOtp()));
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .verifyOtp('123456')),
      );
      expect(states.last, isA<change_password.VerificationSucceeded>());
      expect(states.last.otpVerified, isTrue);
    });
  });

  group('WearOsCategoriesBloc', () {
    late FakeEventRepository events;
    late wear.WearOsCategoriesBloc bloc;
    const shown = CategoryModel(
      id: 'c1',
      categoryType: CategoryEnum.text,
      name: 'Text',
      description: '',
      text: 'old',
    );
    EventModel eventWith(CategoryModel category) => EventModel(
      eventId: 'e1',
      users: const [_phone],
      planSubscribe: getPlan(PlansEnum.free),
      categories: [category],
    );

    setUp(() {
      events = FakeEventRepository();
      final wearRepository = FakeWearOsRepository();
      bloc = wear.WearOsCategoriesBloc(
        getEventUseCase: GetEventUseCase(events),
        updateCategoryUseCase: UpdateCategoryUseCase(events),
        saveEventIdUseCase: SaveEventIdUseCase(wearRepository),
        clearEventIdUseCase: ClearEventIdUseCase(wearRepository),
      );
      SessionService().event = eventWith(shown);
      events.events['e1'] = eventWith(shown.copyWith(text: 'new'));
    });
    tearDown(() => bloc.close());

    test('setLock lands on the latest copy of the category', () async {
      // The owner edited the category after the watch showed it.
      SessionService().event = eventWith(shown.copyWith(text: 'new'));
      await emittedStates(
        bloc,
        () => bloc.add(const .setLock(shown, lock: true)),
      );
      expect(events.updatedCategories.single.lock, isTrue);
      expect(events.updatedCategories.single.text, 'new');
    });

    test('a quick lock then unlock ends unlocked', () async {
      await emittedStates(
        bloc,
        () => bloc
          ..add(const .setLock(shown, lock: true))
          ..add(const .setLock(shown, lock: false)),
      );
      expect(SessionService().event!.categories.single.lock, isFalse);
    });

    test(
      'a failed lock change shows an error and rebuilds the cards',
      () async {
        events.updateError = Exception('offline');
        final states = await emittedStates(
          bloc,
          () => bloc.add(const .setLock(shown, lock: true)),
        );
        expect(states.map((s) => s.runtimeType), [
          wear.ErrorMessage,
          wear.Loaded,
        ]);
        expect(states.first.isOneShot, isTrue);
        expect(states.last.event!.categories.single.lock, isFalse);
      },
    );

    test('a failed first load is shown, not toasted', () async {
      SessionService().event = null;
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .init('missing')),
      );
      expect(states.last, isA<wear.LoadFailed>());
      expect(states.last.isOneShot, isFalse);
    });
  });

  group('WearOsLoginBloc', () {
    late FakeWearOsPhone phone;
    late wear_login.WearOsLoginBloc bloc;

    wear_login.WearOsLoginBloc buildBloc({
      Duration replyTimeout = const Duration(seconds: 30),
    }) {
      final repository = WearOsRepositoryImpl(
        localDataSource: FakeWearOsLocal(),
        phoneDataSource: phone,
      );
      return wear_login.WearOsLoginBloc(
        sendPhoneLoginRequestUseCase: SendPhoneLoginRequestUseCase(repository),
        watchPhoneLoginRepliesUseCase: WatchPhoneLoginRepliesUseCase(
          repository,
        ),
        replyTimeout: replyTimeout,
        successDelay: Duration.zero,
      )..add(const .init());
    }

    List<wear_login.WearOsLoginStatus> statuses(
      List<wear_login.WearOsLoginState> states,
    ) => [for (final s in states) s.status];

    setUp(() => phone = FakeWearOsPhone());
    tearDown(() => bloc.close());

    test('a success reply opens the event', () async {
      bloc = buildBloc();
      final states = <wear_login.WearOsLoginState>[];
      final sub = bloc.stream.listen(states.add);
      bloc.add(const .requestLogin());
      await pumpEventQueue();
      expect(states.last, isA<wear_login.Loading>());
      expect(states.last.status, wear_login.WearOsLoginStatus.waitingForPhone);

      phone.reply({
        'path': '/login_response',
        'status': 'success',
        'eventId': 'e1',
      });
      await pumpEventQueue();
      await sub.cancel();

      expect(phone.sent, ['/start_login']);
      final last = states.last;
      expect(last, isA<wear_login.NavigateToCategories>());
      expect(last.isOneShot, isTrue);
      expect((last as wear_login.NavigateToCategories).eventId, 'e1');
      expect(
        states.whereType<wear_login.Loaded>().last.status,
        wear_login.WearOsLoginStatus.loginSuccessful,
      );
    });

    test(
      'no reply in time asks to open the app; a late reply still counts',
      () async {
        bloc = buildBloc(replyTimeout: const Duration(milliseconds: 20));
        final states = <wear_login.WearOsLoginState>[];
        final sub = bloc.stream.listen(states.add);
        bloc.add(const .requestLogin());
        await Future<void>.delayed(const Duration(milliseconds: 60));
        expect(states.last, isA<wear_login.Loaded>());
        expect(
          states.last.status,
          wear_login.WearOsLoginStatus.phoneNotResponding,
        );

        phone.reply({'path': '/login_response', 'status': 'partner'});
        await pumpEventQueue();
        await sub.cancel();
        expect(states.last.status, wear_login.WearOsLoginStatus.noOwner);
      },
    );

    test('a reply before the send finished is not overwritten', () async {
      bloc = buildBloc();
      phone.onSent = () =>
          phone.reply({'path': '/login_response', 'status': 'failed'});
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .requestLogin()),
      );
      expect(states.last, isA<wear_login.Loaded>());
      expect(states.last.status, wear_login.WearOsLoginStatus.loginFailed);
      expect(
        statuses(states),
        isNot(contains(wear_login.WearOsLoginStatus.waitingForPhone)),
      );
    });

    test('a failed send shows the error status', () async {
      bloc = buildBloc();
      phone.sendError = Exception('not connected');
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .requestLogin()),
      );
      expect(states.last, isA<wear_login.ErrorMessage>());
      expect(states.last.isOneShot, isFalse);
      expect(states.last.status, wear_login.WearOsLoginStatus.sendFailed);
    });

    test('a second tap while waiting sends nothing more', () async {
      bloc = buildBloc();
      await emittedStates(
        bloc,
        () => bloc
          ..add(const .requestLogin())
          ..add(const .requestLogin()),
      );
      expect(phone.sent, hasLength(1));
    });
  });
}
