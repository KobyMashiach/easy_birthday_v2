import 'dart:ui';

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/login_with_password_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/logout_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:easy_birthday/features/auth/presentation/bloc/login_bloc.dart'
    as login;
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/create_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_media_usecase.dart';
import 'package:easy_birthday/features/onboarding/presentation/bloc/first_register_bloc.dart'
    as onboarding;
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/settings/presentation/bloc/settings_bloc.dart'
    as settings;
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/user_exists_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

const _ownerPhone = '+972500000001';
const _partnerPhone = '+972500000002';

PersonaModel _persona(
  String phone, {
  RoleModel role = RoleModel.owner,
  bool registerComplete = true,
  String? eventId = 'e1',
}) => PersonaModel(
  name: phone,
  phoneNumber: phone,
  password: '',
  role: role,
  registerComplete: registerComplete,
  eventId: eventId,
);

EventModel _event({List<String> users = const [_ownerPhone, _partnerPhone]}) =>
    EventModel(
      eventId: 'e1',
      users: users,
      planSubscribe: getPlan(PlansEnum.free),
    );

void main() {
  late FakeEventRepository events;
  late FakeUserRepository users;
  late FakeAuthRepository auth;
  late FakeSettingsRepository settingsRepository;
  final Color originalColor = AppColors.primaryColor;

  setUp(() {
    SessionService().reset();
    events = FakeEventRepository();
    users = FakeUserRepository();
    auth = FakeAuthRepository();
    settingsRepository = FakeSettingsRepository();
  });
  tearDown(() => changeAppColors(originalColor));

  group('SettingsBloc', () {
    late settings.SettingsBloc bloc;

    setUp(() {
      bloc = settings.SettingsBloc(
        logoutUseCase: LogoutUseCase(auth),
        deleteAccountUseCase: DeleteAccountUseCase(auth),
        saveAppSettingsUseCase: SaveAppSettingsUseCase(settingsRepository),
        saveUserUseCase: SaveUserUseCase(users),
        savePartnerUseCase: SavePartnerUseCase(users),
        updateEventUseCase: UpdateEventUseCase(events),
      );
      SessionService()
        ..user = _persona(_ownerPhone)
        ..partner = _persona(_partnerPhone, role: RoleModel.partner)
        ..event = _event();
    });
    tearDown(() => bloc.close());

    test('changeLanguage saves it and rebuilds the app', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .changeLanguage('en')),
      );
      expect(settingsRepository.saved.single.languageCode, 'en');
      expect(
        states.single,
        isA<settings.NavigateToBuildApp>().having(
          (s) => s.seconds,
          'seconds',
          2,
        ),
      );
    });

    test('changeColor (owner) saves settings and the event color', () async {
      const color = Color(0xFF112233);
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .changeColor(color)),
      );
      expect(settingsRepository.saved.single.appColor, color);
      expect(events.updatedEvents.single.appColor, color);
      expect(states.single, isA<settings.NavigateToBuildApp>());
    });

    test(
      'changeColor reports a failed event write and still rebuilds',
      () async {
        events.updateError = Exception('offline');
        final states = await emittedStates(
          bloc,
          () => bloc.add(const .changeColor(Color(0xFF445566))),
        );
        expect(states, [
          isA<settings.ErrorMessage>(),
          isA<settings.NavigateToBuildApp>(),
        ]);
      },
    );

    test('changeColor reports a failed settings save', () async {
      settingsRepository.saveError = Exception('disk full');
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .changeColor(Color(0xFF445566))),
      );
      expect(states.single, isA<settings.ErrorMessage>());
      // The unsaved color is not left applied.
      expect(AppColors.primaryColor, originalColor);
      expect(events.updatedEvents, isEmpty);
    });

    test('changeGender (owner) saves both personas', () async {
      await emittedStates(
        bloc,
        () => bloc.add(
          const .changeGender(ownerGender: 'female', partnerGender: 'male'),
        ),
      );
      expect(SessionService().user.gender, 'female');
      expect(SessionService().partner!.gender, 'male');
      expect(users.log, [
        'saveUser:$_ownerPhone',
        'savePartner:$_partnerPhone',
      ]);
    });

    test('logout leaves for login even when cleanup fails', () async {
      auth.logoutError = Exception('hive');
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .logout()),
      );
      expect(states.single, isA<settings.NavigateToLogin>());
    });

    test('deleteAccount: failure reports it (and can be retried), success '
        'goes to login', () async {
      auth.deleteAccountError = Exception('denied');
      var states = await emittedStates(
        bloc,
        () => bloc.add(const .deleteAccount()),
      );
      expect(states.single, isA<settings.DeleteAccountFailed>());

      auth.deleteAccountError = null;
      states = await emittedStates(
        bloc,
        () => bloc.add(const .deleteAccount()),
      );
      expect(states.single, isA<settings.NavigateToLogin>());
    });

    test('a repeated delete confirmation deletes once', () async {
      final states = await emittedStates(bloc, () {
        bloc
          ..add(const .deleteAccount())
          ..add(const .deleteAccount())
          ..add(const .logout());
      });
      expect(auth.log.where((call) => call == 'deleteAccount'), hasLength(1));
      expect(auth.log, isNot(contains('logout')));
      expect(states.single, isA<settings.NavigateToLogin>());
    });

    test('changePassword stores it encrypted; failure is reported', () async {
      await emittedStates(bloc, () => bloc.add(const .changePassword('abc')));
      expect(SessionService().user.password, isNot(anyOf('', 'abc')));

      users.saveUserError = Exception('offline');
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .changePassword('abcd')),
      );
      expect(states.single, isA<settings.PasswordChangeFailed>());
    });

    test('changeGender: a failed user save is reported and the partner is '
        'still saved', () async {
      users.saveUserError = const AppException(AppErrorType.networkError);
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .changeGender(ownerGender: 'female', partnerGender: 'male'),
        ),
      );
      expect(states.single, isA<settings.ErrorMessage>());
      expect(users.log, contains('savePartner:$_partnerPhone'));
    });
  });

  group('LoginBloc', () {
    late login.LoginBloc bloc;

    setUp(() {
      bloc = login.LoginBloc(
        sendOtpUseCase: SendOtpUseCase(auth),
        verifyOtpUseCase: VerifyOtpUseCase(auth),
        loginWithPasswordUseCase: LoginWithPasswordUseCase(auth),
        userExistsUseCase: UserExistsUseCase(users),
        getUserUseCase: GetUserUseCase(users),
        saveUserUseCase: SaveUserUseCase(users),
        createPartnerUseCase: CreatePartnerUseCase(users),
        getEventUseCase: GetEventUseCase(events),
        saveAppSettingsUseCase: SaveAppSettingsUseCase(settingsRepository),
      );
      events.events['e1'] = _event().copyWith(
        appColor: const Color(0xFF00FF00),
      );
      users.remote[_ownerPhone] = _persona(_ownerPhone);
      users.remote[_partnerPhone] = _persona(
        _partnerPhone,
        role: RoleModel.partner,
      );
      auth.accounts[_ownerPhone] = (_persona(_ownerPhone), 'secret');
      auth.accounts[_partnerPhone] = (
        _persona(_partnerPhone, role: RoleModel.partner),
        'secret',
      );
    });
    tearDown(() => bloc.close());

    test('owner password login loads event, partner and goes home', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .loginWithPassword(
            phoneNumber: _ownerPhone,
            password: 'secret',
            isWatch: false,
          ),
        ),
      );
      expect(states.map((s) => s.runtimeType), [
        login.Loading,
        login.NavigateToHome,
      ]);
      expect(SessionService().user.phoneNumber, _ownerPhone);
      expect(SessionService().event?.eventId, 'e1');
      expect(SessionService().partner?.phoneNumber, _partnerPhone);
      expect(users.log, contains('createPartner:$_partnerPhone'));
      // The account's own color is applied and saved.
      expect(settingsRepository.saved.single.appColor, const Color(0xFF00FF00));
    });

    test('partner password login keeps the owner on the device only and goes '
        'home', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .loginWithPassword(
            phoneNumber: _partnerPhone,
            password: 'secret',
            isWatch: false,
          ),
        ),
      );
      expect(states.last, isA<login.NavigateToHome>());
      // CreatePartner never rewrites the owner's existing document.
      expect(users.log, contains('createPartner:$_ownerPhone'));
      expect(users.log, isNot(contains('savePartner:$_ownerPhone')));
    });

    test('incomplete owner registration goes to onboarding', () async {
      auth.accounts[_ownerPhone] = (
        _persona(_ownerPhone, registerComplete: false),
        'secret',
      );
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .loginWithPassword(
            phoneNumber: _ownerPhone,
            password: 'secret',
            isWatch: false,
          ),
        ),
      );
      expect(states.last, isA<login.NavigateToOnboarding>());
    });

    test('wrong password shows the form again with the error', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .loginWithPassword(
            phoneNumber: _ownerPhone,
            password: 'wrong',
            isWatch: false,
          ),
        ),
      );
      expect(states.map((s) => s.runtimeType), [
        login.Loading,
        login.Initial,
        login.ErrorMessage,
      ]);
      expect((states.last as login.ErrorMessage).error, t.wrong_password);
    });

    test('sendCode: unknown phone errors, known phone opens OTP', () async {
      var states = await emittedStates(
        bloc,
        () => bloc.add(const .sendCode(phoneNumber: '+10', isWatch: false)),
      );
      expect(
        (states.last as login.ErrorMessage).error,
        t.phone_not_exist_system,
      );
      expect(auth.log, isEmpty);

      states = await emittedStates(
        bloc,
        () => bloc.add(
          const .sendCode(phoneNumber: _ownerPhone, isWatch: false),
        ),
      );
      expect(states.first, isA<login.Loading>());
      expect(
        (states.last as login.NavigateToOtp).verificationId,
        'verification-id',
      );
    });

    test('sendCode verified instantly skips the code page', () async {
      auth.verificationId = null;
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .sendCode(phoneNumber: _ownerPhone, isWatch: false),
        ),
      );
      expect(states.whereType<login.NavigateToOtp>(), isEmpty);
      expect(states.last, isA<login.NavigateToHome>());
    });

    test('verifyOtp failure shows the translated message', () async {
      auth.verifyOtpError = const AppException(
        AppErrorType.unauthorized,
        message: 'bad code',
      );
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .verifyOtp(
            verificationId: 'v',
            otpCode: '000000',
            phoneNumber: _ownerPhone,
            isWatch: false,
          ),
        ),
      );
      expect((states.single as login.ErrorMessage).error, 'bad code');
      expect(users.log, isEmpty);
    });

    test('verifyOtp success completes the login', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          const .verifyOtp(
            verificationId: 'v',
            otpCode: '123456',
            phoneNumber: _ownerPhone,
            isWatch: false,
          ),
        ),
      );
      expect(states.last, isA<login.NavigateToHome>());
    });
  });

  group('FirstRegisterBloc', () {
    late onboarding.FirstRegisterBloc bloc;

    setUp(() {
      bloc = onboarding.FirstRegisterBloc(
        saveUserUseCase: SaveUserUseCase(users),
        getUserUseCase: GetUserUseCase(users),
        createPartnerUseCase: CreatePartnerUseCase(users),
        savePartnerUseCase: SavePartnerUseCase(users),
        getEventUseCase: GetEventUseCase(events),
        createEventUseCase: CreateEventUseCase(events),
        updateEventUseCase: UpdateEventUseCase(events),
        uploadMediaUseCase: UploadMediaUseCase(events),
        saveAppSettingsUseCase: SaveAppSettingsUseCase(settingsRepository),
      );
      SessionService().user = _persona(_ownerPhone, registerComplete: false);
    });
    tearDown(() => bloc.close());

    test('init loads the event plan (free when there is no event)', () async {
      var states = await emittedStates(bloc, () => bloc.add(const .init()));
      expect(states.single, isA<onboarding.Loaded>());
      expect(states.single.planModel.title, 'Free');

      events.events['e1'] = _event().copyWith(
        planSubscribe: getPlan(PlansEnum.standard),
      );
      states = await emittedStates(bloc, () => bloc.add(const .init()));
      expect(states.single.planModel.productPurchaseName, 'standard_plan');
    });

    test('partner details without an event create it and link both', () async {
      await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(
            _persona(_partnerPhone, role: RoleModel.partner, eventId: null),
          ),
        ),
      );
      expect(events.createEventCalls, 1);
      expect(SessionService().partner!.eventId, 'e1');
      expect(users.log, [
        'createPartner:$_partnerPhone',
        'saveUser:$_ownerPhone',
        'savePartner:$_partnerPhone',
      ]);
    });

    test('the owner\'s own phone is refused as the partner\'s', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(_persona(_ownerPhone, role: RoleModel.partner)),
        ),
      );
      expect(states.single, isA<onboarding.PartnerPhoneTaken>());
      expect(users.log, isEmpty);
      expect(events.createEventCalls, 0);
    });

    test('a phone of another event\'s account is refused and not retried '
        'by later steps', () async {
      users.remote[_partnerPhone] = _persona(_partnerPhone, eventId: 'other');
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(_persona(_partnerPhone, role: RoleModel.partner)),
        ),
      );
      expect(states.single, isA<onboarding.PartnerPhoneTaken>());
      expect(users.log, isEmpty);

      SessionService().event = _event();
      final textStates = await emittedStates(
        bloc,
        () => bloc.add(const .chooseTexts({'a': 'b'})),
      );
      expect(textStates, isEmpty);
      expect(users.log, isEmpty);
    });

    test('an existing partner of this event is linked again', () async {
      users.remote[_partnerPhone] = _persona(
        _partnerPhone,
        role: RoleModel.partner,
      );
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(_persona(_partnerPhone, role: RoleModel.partner)),
        ),
      );
      expect(states, isEmpty);
      expect(users.log.first, 'createPartner:$_partnerPhone');
    });

    test('choosing a color keeps the language in use', () async {
      // Saved settings still holding another language than the one in use.
      SessionService()
        ..event = _event()
        ..appSettings = SessionService().appSettings.copyWith(
          languageCode: 'he',
        );
      await emittedStates(
        bloc,
        () => bloc.add(const .chooseColor(Color(0xFF112233))),
      );
      expect(
        settingsRepository.saved.single.languageCode,
        LocaleSettings.currentLocale.languageCode,
      );
      expect(settingsRepository.saved.single.languageCode, 'en');
    });

    test('a changed partner phone updates the event users', () async {
      events.events['e1'] = _event(users: const [_ownerPhone, '+19999']);
      await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(_persona(_partnerPhone, role: RoleModel.partner)),
        ),
      );
      expect(events.createEventCalls, 0);
      expect(events.updatedEvents.single.users, [_ownerPhone, _partnerPhone]);
    });

    test('finishRegister completes the user and navigates home', () async {
      events.events['e1'] = _event();
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .finishRegister()),
      );
      expect(SessionService().user.registerComplete, isTrue);
      expect(states.single, isA<onboarding.NavigateToHome>());
    });

    test('finishRegister without any event stays on the wizard', () async {
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .finishRegister()),
      );
      expect(SessionService().user.registerComplete, isFalse);
      expect(states.single, isA<onboarding.ErrorMessage>());
    });

    test('a failed step reports the error', () async {
      SessionService().event = _event();
      events.updateError = Exception('offline');
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .chooseTexts({'a': 'b'})),
      );
      expect(states.single, isA<onboarding.ErrorMessage>());
    });

    test('a failed event lookup is an error, never "no event"', () async {
      events.getEventError = const AppException(AppErrorType.networkError);
      final states = await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(_persona(_partnerPhone, role: RoleModel.partner)),
        ),
      );
      expect(states.single, isA<onboarding.ErrorMessage>());
      expect(events.createEventCalls, 0);
    });

    test('later steps retry the partner link and finishing re-syncs '
        'the event', () async {
      events.getEventError = const AppException(AppErrorType.networkError);
      await emittedStates(
        bloc,
        () => bloc.add(
          .savePartnerDetails(_persona(_partnerPhone, role: RoleModel.partner)),
        ),
      );

      // Still offline: the color step fails visibly without crashing.
      const color = Color(0xFF112233);
      final colorStates = await emittedStates(
        bloc,
        () => bloc.add(const .chooseColor(color)),
      );
      expect(colorStates.single, isA<onboarding.ErrorMessage>());

      // Back online: finishing links the existing event (no new one) and
      // writes the color that failed before.
      events.getEventError = null;
      events.events['e1'] = _event();
      final finishStates = await emittedStates(
        bloc,
        () => bloc.add(const .finishRegister()),
      );

      expect(finishStates.single, isA<onboarding.NavigateToHome>());
      expect(events.createEventCalls, 0);
      expect(events.updatedEvents.last.appColor, color);
      expect(SessionService().user.registerComplete, isTrue);
      expect(SessionService().partner?.eventId, 'e1');
    });

    test('finishing stays on the wizard when the user save fails', () async {
      SessionService().event = _event();
      users.saveUserError = const AppException(AppErrorType.networkError);
      final states = await emittedStates(
        bloc,
        () => bloc.add(const .finishRegister()),
      );
      expect(states.single, isA<onboarding.ErrorMessage>());
      expect(SessionService().user.registerComplete, isFalse);
    });

    test('purchasePlan only shows the bought plan (the purchase service '
        'writes it)', () async {
      var states = await emittedStates(
        bloc,
        () => bloc.add(const .purchasePlan('nope')),
      );
      expect(states, isEmpty);

      states = await emittedStates(
        bloc,
        () => bloc.add(const .purchasePlan('platinum_plan')),
      );
      expect(states.single.planModel.isPlatinum, isTrue);
      expect(events.updatedEvents, isEmpty);
    });
  });

  group('PlanModel', () {
    tearDown(() => LocaleSettings.setLocaleSync(AppLocale.en));

    test(
      'shows translated names and features but stores the English title',
      () async {
        final platinum = getPlan(PlansEnum.platinum);
        expect(platinum.displayTitle, 'Platinum');
        expect(platinum.features, hasLength(9));
        expect(getPlan(PlansEnum.free).features.last, contains('10'));

        await LocaleSettings.setLocale(AppLocale.he);
        expect(platinum.displayTitle, 'פלטינום');
        expect(platinum.features.first, contains('AI'));
        expect(platinum.toJson()['title'], 'Platinum');
        expect(platinum.toJson()['features'], platinum.features);

        final restored = PlanModel.fromJson({
          'title': 'Standard',
          'price': 25,
          'features': ['stale text'],
          'productPurchaseName': 'standard_plan',
        });
        expect(restored.isStandard, isTrue);
        expect(restored.features, isNot(contains('stale text')));
      },
    );
  });
}
