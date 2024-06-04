import 'package:dio/dio.dart';
import 'package:farm_scheduling/core/services/image_picker_service.dart';
import 'package:farm_scheduling/data/datasources/auth_data_source/auth_data_source.dart';
import 'package:farm_scheduling/data/datasources/auth_data_source/auth_data_source_impl.dart';
import 'package:farm_scheduling/data/datasources/fatm_data_source/farm_data_source.dart';
import 'package:farm_scheduling/data/datasources/fatm_data_source/farm_data_source_impl.dart';
import 'package:farm_scheduling/data/datasources/imergency_data_source/imergency_data_source.dart';
import 'package:farm_scheduling/data/datasources/imergency_data_source/imergency_data_source_impl.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/repositories/auth_reposotory_impl.dart';
import 'package:farm_scheduling/data/repositories/emergincy_repository_impl.dart';
import 'package:farm_scheduling/data/repositories/farm_repository_impl.dart';
import 'package:farm_scheduling/domain/repositories/auth_repository.dart';
import 'package:farm_scheduling/domain/repositories/emergincy_repository.dart';
import 'package:farm_scheduling/domain/repositories/farm_repository.dart';
import 'package:farm_scheduling/domain/usecases/auth_use_cases.dart';
import 'package:farm_scheduling/domain/usecases/emergency_usecase.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/domain/usecases/image_picker_usecases.dart';
import 'package:farm_scheduling/presentation/fa%C3%A7ades/app_facade.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/auth_bloc.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/image/image_bloc.dart';
import 'package:farm_scheduling/presentation/flows/emergincy_flow/bloc/emergency_bloc.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/bloc/farm_bloc.dart';
import 'package:farm_scheduling/presentation/flows/root_flow/bloc/root_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:farm_scheduling/core/api/auth_interceptor.dart';
import 'package:farm_scheduling/core/blocs/application_bloc/app_bloc.dart';
import 'package:farm_scheduling/core/mediators/bloc_hub/concrete_hub.dart';
import 'package:farm_scheduling/core/mediators/bloc_hub/hub.dart';
import 'package:farm_scheduling/core/mediators/bloc_hub/members_key.dart';
import 'package:farm_scheduling/core/services/init_app_store.dart';
import 'package:farm_scheduling/core/services/session_manager.dart';
import 'package:farm_scheduling/core/services/theme_store.dart';
import 'package:farm_scheduling/core/usecases/app_theme_usecases.dart';
import 'package:farm_scheduling/core/usecases/check_first_initialize_usecase.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<BlocHub>(() => ConcreteHub());
  locator.registerLazySingleton<ThemeStore>(() => ThemeStore());

  locator.registerLazySingleton<InitAppStore>(() => InitAppStore());
  locator.registerLazySingleton<SetAppThemeUseCase>(
      () => SetAppThemeUseCase(locator<ThemeStore>()));

  locator.registerLazySingleton<GetAppThemeUseCase>(
      () => GetAppThemeUseCase(locator<ThemeStore>()));

  locator.registerLazySingleton<CheckFirstInitUseCase>(
      () => CheckFirstInitUseCase(locator<InitAppStore>()));
  locator.registerLazySingleton<CheckLoginUseCase>(() => CheckLoginUseCase());

  locator.registerLazySingleton<AppUiFacade>(() => AppUiFacade(
        setAppThemeUseCase: locator<SetAppThemeUseCase>(),
        getAppThemeUseCase: locator<GetAppThemeUseCase>(),
        checkFirstInitUseCase: locator<CheckFirstInitUseCase>(),
        setFirstTimeUseCase: locator<SetFirstTimeUseCase>(),
      ));
  locator.registerLazySingleton(() => RootCubit());
  locator.registerLazySingleton<AppBloc>(
      () => AppBloc(appUiFacade: locator<AppUiFacade>()));

  locator.registerLazySingleton<SetFirstTimeUseCase>(
      () => SetFirstTimeUseCase(locator<InitAppStore>()));

  locator.registerLazySingleton<SessionManager>(() => DefaultSessionManager());
  locator.registerFactory<Dio>(() => Dio());

  locator.registerLazySingleton<AuthInterceptor>(
      () => AuthInterceptor(locator<SessionManager>(), locator<Dio>()));

  locator.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authDataSource: locator<AuthDataSource>(),
      sessionManager: locator<SessionManager>()));
  locator.registerLazySingleton(
      () => LoginUseCase(authRepository: locator<AuthRepository>()));

  locator.registerLazySingleton<ImergencyDataSource>(
      () => EmergincyDataSourceImpl());
  locator.registerLazySingleton<ImergencyRepository>(() =>
      ImergencyRepositoryImpl(
          imergencyDataSource: locator<ImergencyDataSource>()));

  locator.registerLazySingleton<EmergencyUseCase>(() =>
      EmergencyUseCase(imergencyRepository: locator<ImergencyRepository>()));

  locator.registerLazySingleton<AddEmergencyUseCase>(() =>
      AddEmergencyUseCase(imergencyRepository: locator<ImergencyRepository>()));


  locator.registerLazySingleton<EmergencyTypeUseCase>(() =>
      EmergencyTypeUseCase(imergencyRepository: locator<ImergencyRepository>()));

  locator.registerLazySingleton<EmergencyBloc>(() => EmergencyBloc(
    emergencyTypeUseCase: locator<EmergencyTypeUseCase>(),
      emergencyUseCase: locator<EmergencyUseCase>(),
      addEmergencyUseCase: locator<AddEmergencyUseCase>()));

  locator.registerLazySingleton<FarmDataSource>(() => FarmDataSourceImpl());
  locator.registerLazySingleton<FarmRepository>(() => FarmRepositoryImp(
        farmDataSource: locator<FarmDataSource>(),
      ));
  locator.registerLazySingleton(
      () => FarmUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
      () => FieldUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
      () => ToolUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
      () => TaskUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
      () => CropUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
      () => CropSeedUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
      () => AddFieldUseCase(farmRepository: locator<FarmRepository>()));

  locator.registerLazySingleton(
          () => UpdateStatusFieldUseCase(farmRepository: locator<FarmRepository>()));
  locator.registerFactory(
      () => FarmBloc(addFieldUseCase: locator<AddFieldUseCase>(),updateStatusFieldUseCase: locator<UpdateStatusFieldUseCase>()));

  locator.registerLazySingleton(
      () => VerifyOTPUseCase(authRepository: locator<AuthRepository>()));

  locator.registerLazySingleton(
      () => LogoutUseCase(authRepository: locator<AuthRepository>()));
  locator.registerFactory<ImageBloc>(() => ImageBloc());
  locator.registerLazySingleton<GetImageFromCameraUseCase>(
          () => GetImageFromCameraUseCase(locator<ImagePickerService>()));

  locator.registerLazySingleton<GetImageFromGalleryUseCase>(
          () => GetImageFromGalleryUseCase(locator<ImagePickerService>()));

  locator.registerLazySingleton<ImagePickerService>(() => ImagePickerService());

  locator.registerLazySingleton(
          () => GetProfileUseCase(authRepository: locator<AuthRepository>()));

  locator.registerLazySingleton(
          () => UpdateProfileUseCase(authRepository: locator<AuthRepository>()));


  locator.registerLazySingleton<AuthBloc>(() => AuthBloc(
      loginUseCase: locator<LoginUseCase>(),
      verifyOTPUseCase: locator<VerifyOTPUseCase>(),
      logoutUseCase: locator<LogoutUseCase>(),getProfileUseCase:locator<GetProfileUseCase>(),updateProfileUseCase:locator<UpdateProfileUseCase>()),);
}
