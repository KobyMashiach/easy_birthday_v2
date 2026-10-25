import 'package:easy_birthday/core/di/injector.dart';
import 'package:easy_birthday/core/di/app_dependencies.dart';
import 'package:easy_birthday/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy_birthday/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/login_with_password_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/logout_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:easy_birthday/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:easy_birthday/features/category_editor/domain/repositories/greeting_repository.dart';
import 'package:easy_birthday/features/category_editor/domain/usecases/generate_greeting_usecase.dart';
import 'package:easy_birthday/features/event/domain/repositories/event_repository.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/add_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/create_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/delete_media_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_current_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/get_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/reorder_categories_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/replace_memory_game_images_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_category_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_children_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/update_event_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_category_files_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/upload_media_usecase.dart';
import 'package:easy_birthday/features/event/domain/usecases/watch_event_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/repositories/purchase_repository.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/buy_plan_usecase.dart';
import 'package:easy_birthday/features/purchase/domain/usecases/watch_purchase_outcomes_usecase.dart';
import 'package:easy_birthday/features/settings/domain/repositories/settings_repository.dart';
import 'package:easy_birthday/features/settings/domain/usecases/get_app_settings_usecase.dart';
import 'package:easy_birthday/features/settings/domain/usecases/save_app_settings_usecase.dart';
import 'package:easy_birthday/features/user/domain/repositories/user_repository.dart';
import 'package:easy_birthday/features/user/domain/usecases/create_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_local_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_local_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/get_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/register_owner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_partner_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:easy_birthday/features/user/domain/usecases/user_exists_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/repositories/wear_os_repository.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/clear_event_id_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/get_saved_event_id_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/save_event_id_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/send_phone_login_request_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/watch_phone_login_replies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> buildRepositoryProviders(AppDependencies deps) {
  return [
    // repositories
    RepositoryProvider<UserRepository>.value(value: deps.userRepository),
    RepositoryProvider<EventRepository>.value(value: deps.eventRepository),
    RepositoryProvider<AuthRepository>.value(value: deps.authRepository),
    RepositoryProvider<SettingsRepository>.value(
      value: deps.settingsRepository,
    ),
    RepositoryProvider<WearOsRepository>.value(value: deps.wearOsRepository),
    RepositoryProvider<GreetingRepository>.value(
      value: deps.greetingRepository,
    ),
    RepositoryProvider<PurchaseRepository>.value(
      value: deps.purchaseRepository,
    ),

    // use cases
    RepositoryProvider<DeleteAccountUseCase>(
      create: (context) => DeleteAccountUseCase(context.read<AuthRepository>()),
    ),
    RepositoryProvider<LoginWithPasswordUseCase>(
      create: (context) =>
          LoginWithPasswordUseCase(context.read<AuthRepository>()),
    ),
    RepositoryProvider<LogoutUseCase>(
      create: (context) => LogoutUseCase(context.read<AuthRepository>()),
    ),
    RepositoryProvider<SendOtpUseCase>(
      create: (context) => SendOtpUseCase(context.read<AuthRepository>()),
    ),
    RepositoryProvider<VerifyOtpUseCase>(
      create: (context) => VerifyOtpUseCase(context.read<AuthRepository>()),
    ),
    RepositoryProvider<AddCategoryUseCase>(
      create: (context) => AddCategoryUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<AddCategoryFilesUseCase>(
      create: (context) =>
          AddCategoryFilesUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<CreateEventUseCase>(
      create: (context) => CreateEventUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<DeleteCategoryUseCase>(
      create: (context) =>
          DeleteCategoryUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<DeleteCategoryFilesUseCase>(
      create: (context) =>
          DeleteCategoryFilesUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<DeleteMediaUseCase>(
      create: (context) => DeleteMediaUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<GetCurrentCategoryUseCase>(
      create: (context) =>
          GetCurrentCategoryUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<GetEventUseCase>(
      create: (context) => GetEventUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<ReorderCategoriesUseCase>(
      create: (context) =>
          ReorderCategoriesUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<ReplaceMemoryGameImagesUseCase>(
      create: (context) =>
          ReplaceMemoryGameImagesUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<UpdateCategoryUseCase>(
      create: (context) =>
          UpdateCategoryUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<UpdateChildrenUseCase>(
      create: (context) =>
          UpdateChildrenUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<UpdateEventUseCase>(
      create: (context) => UpdateEventUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<UploadCategoryFilesUseCase>(
      create: (context) =>
          UploadCategoryFilesUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<UploadMediaUseCase>(
      create: (context) => UploadMediaUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<WatchEventUseCase>(
      create: (context) => WatchEventUseCase(context.read<EventRepository>()),
    ),
    RepositoryProvider<GetAppSettingsUseCase>(
      create: (context) =>
          GetAppSettingsUseCase(context.read<SettingsRepository>()),
    ),
    RepositoryProvider<SaveAppSettingsUseCase>(
      create: (context) =>
          SaveAppSettingsUseCase(context.read<SettingsRepository>()),
    ),
    RepositoryProvider<CreatePartnerUseCase>(
      create: (context) => CreatePartnerUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<GetLocalPartnerUseCase>(
      create: (context) =>
          GetLocalPartnerUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<GetLocalUserUseCase>(
      create: (context) => GetLocalUserUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<GetUserUseCase>(
      create: (context) => GetUserUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<RegisterOwnerUseCase>(
      create: (context) => RegisterOwnerUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<SavePartnerUseCase>(
      create: (context) => SavePartnerUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<SaveUserUseCase>(
      create: (context) => SaveUserUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<UserExistsUseCase>(
      create: (context) => UserExistsUseCase(context.read<UserRepository>()),
    ),
    RepositoryProvider<ClearEventIdUseCase>(
      create: (context) =>
          ClearEventIdUseCase(context.read<WearOsRepository>()),
    ),
    RepositoryProvider<GetSavedEventIdUseCase>(
      create: (context) =>
          GetSavedEventIdUseCase(context.read<WearOsRepository>()),
    ),
    RepositoryProvider<SaveEventIdUseCase>(
      create: (context) => SaveEventIdUseCase(context.read<WearOsRepository>()),
    ),
    RepositoryProvider<BuyPlanUseCase>(
      create: (context) => BuyPlanUseCase(context.read<PurchaseRepository>()),
    ),
    RepositoryProvider<WatchPurchaseOutcomesUseCase>(
      create: (_) => WatchPurchaseOutcomesUseCase(Injector().purchaseService),
    ),
    RepositoryProvider<GenerateGreetingUseCase>(
      create: (context) =>
          GenerateGreetingUseCase(context.read<GreetingRepository>()),
    ),
    RepositoryProvider<SendPhoneLoginRequestUseCase>(
      create: (context) =>
          SendPhoneLoginRequestUseCase(context.read<WearOsRepository>()),
    ),
    RepositoryProvider<WatchPhoneLoginRepliesUseCase>(
      create: (context) =>
          WatchPhoneLoginRepliesUseCase(context.read<WearOsRepository>()),
    ),
  ];
}
