import 'package:easy_birthday/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:easy_birthday/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy_birthday/features/category_editor/data/datasources/greeting_remote_data_source.dart';
import 'package:easy_birthday/features/category_editor/data/repositories_impl/greeting_repository_impl.dart';
import 'package:easy_birthday/features/category_editor/domain/repositories/greeting_repository.dart';
import 'package:easy_birthday/features/event/data/datasources/event_remote_data_source.dart';
import 'package:easy_birthday/features/event/data/repositories_impl/event_repository_impl.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/purchase/data/datasources/pending_purchase_local_data_source.dart';
import 'package:easy_birthday/features/purchase/data/datasources/purchase_store_data_source.dart';
import 'package:easy_birthday/features/purchase/data/repositories_impl/purchase_repository_impl.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';
import 'package:easy_birthday/features/settings/data/datasources/app_settings_local_data_source.dart';
import 'package:easy_birthday/features/settings/data/repositories_impl/settings_repository_impl.dart';
import 'package:easy_birthday/features/settings/domain/repositories/settings_repository.dart';
import 'package:easy_birthday/features/user/data/datasources/user_local_data_source.dart';
import 'package:easy_birthday/features/user/data/datasources/user_remote_data_source.dart';
import 'package:easy_birthday/features/user/data/repositories_impl/user_repository_impl.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';
import 'package:easy_birthday/features/wear_os/data/datasources/wear_os_local_data_source.dart';
import 'package:easy_birthday/features/wear_os/data/repositories_impl/wear_os_repository_impl.dart';
import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';

/// Repositories shared by the whole app (created once, after Hive is ready).
class AppDependencies {
  final UserRepository userRepository;
  final EventRepository eventRepository;
  final AuthRepository authRepository;
  final SettingsRepository settingsRepository;
  final WearOsRepository wearOsRepository;
  final GreetingRepository greetingRepository;
  final PurchaseRepository purchaseRepository;

  const AppDependencies._({
    required this.userRepository,
    required this.eventRepository,
    required this.authRepository,
    required this.settingsRepository,
    required this.wearOsRepository,
    required this.greetingRepository,
    required this.purchaseRepository,
  });

  factory AppDependencies.create() {
    final userRemote = UserRemoteDataSourceImpl();
    final eventRemote = EventRemoteDataSourceImpl();
    return AppDependencies._(
      userRepository: UserRepositoryImpl(
        localDataSource: UserLocalDataSourceImpl(),
        remoteDataSource: userRemote,
      ),
      eventRepository: EventRepositoryImpl(remoteDataSource: eventRemote),
      authRepository: AuthRepositoryImpl(
        authDataSource: AuthRemoteDataSourceImpl(),
        userDataSource: userRemote,
        eventDataSource: eventRemote,
      ),
      settingsRepository: SettingsRepositoryImpl(
        localDataSource: AppSettingsLocalDataSourceImpl(),
      ),
      wearOsRepository: WearOsRepositoryImpl(
        localDataSource: WearOsLocalDataSourceImpl(),
      ),
      greetingRepository: GreetingRepositoryImpl(
        remoteDataSource: GreetingRemoteDataSourceImpl(),
      ),
      purchaseRepository: PurchaseRepositoryImpl(
        storeDataSource: PurchaseStoreDataSourceImpl(),
        localDataSource: PendingPurchaseLocalDataSourceImpl(),
      ),
    );
  }
}
