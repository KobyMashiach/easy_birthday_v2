import 'package:easy_birthday/core/errors/app_exception.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/features/event/data/models/event_model.dart';
import 'package:easy_birthday/features/event/data/models/plan_model.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/get_app_settings_usecase.dart';
import 'package:easy_birthday/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:easy_birthday/features/user/data/models/persona_model.dart';
import 'package:easy_birthday/features/user/data/models/role_model.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_local_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_local_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/get_saved_event_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/fakes.dart';

const _ownerPhone = '+972500000001';
const _partnerPhone = '+972500000002';

PersonaModel _persona(String phone, RoleModel role, {String gender = 'male'}) =>
    PersonaModel(
      name: phone,
      phoneNumber: phone,
      password: '',
      role: role,
      registerComplete: true,
      eventId: 'e1',
      gender: gender,
    );

void main() {
  late FakeUserRepository users;
  late FakeEventRepository events;
  late SplashBloc bloc;

  setUp(() {
    SessionService().reset();
    users = FakeUserRepository();
    events = FakeEventRepository();
    bloc = SplashBloc(
      getAppSettingsUseCase: GetAppSettingsUseCase(FakeSettingsRepository()),
      getLocalUserUseCase: GetLocalUserUseCase(users),
      getLocalPartnerUseCase: GetLocalPartnerUseCase(users),
      getUserUseCase: GetUserUseCase(users),
      getEventUseCase: GetEventUseCase(events),
      createPartnerUseCase: CreatePartnerUseCase(users),
      getSavedEventIdUseCase: GetSavedEventIdUseCase(FakeWearOsRepository()),
    );
    events.events['e1'] = EventModel(
      eventId: 'e1',
      users: const [_ownerPhone, _partnerPhone],
      planSubscribe: getPlan(PlansEnum.free),
    );
    users.remote[_ownerPhone] = _persona(_ownerPhone, RoleModel.owner);
    users.remote[_partnerPhone] = _persona(_partnerPhone, RoleModel.partner);
  });
  tearDown(() => bloc.close());

  Future<SplashState> start() async {
    bloc.add(const .init());
    return bloc.stream.firstWhere((state) => state.isOneShot);
  }

  test('signed out goes to login', () async {
    expect(await start(), isA<NavigateToLogin>());
  });

  test('an owner loads the event and partner and goes home', () async {
    SessionService().user = _persona(_ownerPhone, RoleModel.owner);
    expect(await start(), isA<NavigateToHome>());
    expect(SessionService().event?.eventId, 'e1');
    expect(SessionService().partner?.phoneNumber, _partnerPhone);
  });

  test('the server copy of the user sets the gender', () async {
    SessionService().user = _persona(_ownerPhone, RoleModel.owner);
    users.remote[_ownerPhone] = _persona(
      _ownerPhone,
      RoleModel.owner,
      gender: 'female',
    );
    await start();
    expect(SessionService().gender, GenderContext.female);
  });

  test(
    'an owner whose partner deleted their account still goes home',
    () async {
      final localPartner = _persona(_partnerPhone, RoleModel.partner);
      SessionService()
        ..user = _persona(_ownerPhone, RoleModel.owner)
        ..partner = localPartner;
      users.remote.remove(_partnerPhone);
      expect(await start(), isA<NavigateToHome>());
      expect(SessionService().partner, localPartner);
    },
  );

  test('a partner keeps the owner on the device only and goes home', () async {
    SessionService().user = _persona(_partnerPhone, RoleModel.partner);
    expect(await start(), isA<NavigateToHome>());
    expect(users.log, ['createPartner:$_ownerPhone']);
  });

  test('a failed read (offline) goes to login instead of hanging', () async {
    SessionService().user = _persona(_ownerPhone, RoleModel.owner);
    events.getEventError = const AppException(AppErrorType.networkError);
    expect(await start(), isA<NavigateToLogin>());
  });
}
