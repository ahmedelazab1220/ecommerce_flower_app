// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/auth/data/api/auth_retorfit_client.dart' as _i257;
import '../../../features/auth/data/data_source/contract/auth_local_data_source.dart'
    as _i1015;
import '../../../features/auth/data/data_source/contract/auth_remote_data_source.dart'
    as _i305;
import '../../../features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i241;
import '../../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i212;
import '../../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i822;
import '../../../features/auth/domain/repo/auth_repo.dart' as _i913;
import '../../../features/auth/domain/use_case/guest_use_case.dart' as _i124;
import '../../../features/auth/domain/use_case/login_use_case.dart' as _i197;
import '../../../features/auth/domain/use_case/register_use_case.dart' as _i336;
import '../../../features/auth/presentation/view_model/login/login_cubit.dart'
    as _i204;
import '../../../features/auth/presentation/view_model/register/register_cubit.dart'
    as _i316;
import '../../../features/home/data/api/home_retrofit_client.dart' as _i945;
import '../../../features/home/data/data_source/contract/home_local_data_source.dart'
    as _i493;
import '../../../features/home/data/data_source/contract/home_remote_data_source.dart'
    as _i1043;
import '../../../features/home/data/data_source/local/home_local_data_source_impl.dart'
    as _i640;
import '../../../features/home/data/data_source/remote/home_remote_data_source_impl.dart'
    as _i859;
import '../../../features/home/data/repo_impl/home_repo_impl.dart' as _i801;
import '../../../features/home/domain/repo/home_repo.dart' as _i242;
import '../../../features/home/domain/use_case/get_home_data_use_case.dart'
    as _i1065;
import '../../../features/home/presentation/view_model/home_cubit.dart'
    as _i595;
import '../../../features/main_layout/presentation/view_model/cubit/main_layout_cubit.dart'
    as _i393;
import '../../../features/reset_password/data/api/reset_password_retrofit_client.dart'
    as _i27;
import '../../../features/reset_password/data/data_source/contract/reset_password_data_source.dart'
    as _i86;
import '../../../features/reset_password/data/data_source/remote/reset_password_data_source_impl.dart'
    as _i603;
import '../../../features/reset_password/data/repo_impl/reset_password_repo_impl.dart'
    as _i31;
import '../../../features/reset_password/domain/repo/reset_password_repo.dart'
    as _i421;
import '../../../features/reset_password/domain/use_case/reset_password_use_case.dart'
    as _i468;
import '../../../features/reset_password/presentation/view_model/reset_password_cubit.dart'
    as _i545;
import '../../functions/initial_route_function.dart' as _i687;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../datasource_excution/api_manager.dart' as _i28;
import '../datasource_excution/dio_module.dart' as _i953;
import '../flutter_secure_storage_module.dart' as _i712;
import '../location_service/location_service.dart' as _i533;
import '../logging/logger_module.dart' as _i470;
import '../validator/validator.dart' as _i468;
import 'module/shared_preference_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferenceModule = _$SharedPreferenceModule();
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferenceModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i28.ApiManager>(() => _i28.ApiManager());
    gh.singleton<_i533.LocationService>(() => _i533.LocationService());
    gh.singleton<_i393.MainLayoutCubit>(() => _i393.MainLayoutCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providerInterceptor());
    gh.lazySingleton<_i953.AppInterceptors>(() => _i953.AppInterceptors());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => secureStorageModule.storage);
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i468.Validator>(() => _i468.Validator());
    gh.factory<_i493.HomeLocalDataSource>(
        () => _i640.HomeLocalDataSourceImpl());
    gh.singleton<_i649.BlocObserverService>(
        () => _i649.BlocObserverService(gh<_i974.Logger>()));
    gh.factory<_i1015.AuthLocalDataSource>(
        () => _i241.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i27.ResetPasswordRetrofitClient>(
        () => _i27.ResetPasswordRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i257.AuthRetrofitClient>(
        () => _i257.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i945.HomeRetrofitClient>(
        () => _i945.HomeRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i687.RouteInitializer>(() => _i687.RouteInitializer(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i305.AuthRemoteDataSource>(
        () => _i212.AuthRemoteDataSourceImpl(gh<_i257.AuthRetrofitClient>()));
    gh.singleton<_i1043.HomeRemoteDataSource>(
        () => _i859.HomeRemoteDataSourceImpl(gh<_i945.HomeRetrofitClient>()));
    gh.lazySingleton<_i86.ResetPasswordDataSource>(() =>
        _i603.ResetPasswordDataSourceImpl(
            gh<_i27.ResetPasswordRetrofitClient>()));
    gh.factory<_i242.HomeRepo>(() => _i801.HomeRepoImpl(
          gh<_i1043.HomeRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i913.AuthRepo>(() => _i822.AuthRepoImpl(
          gh<_i305.AuthRemoteDataSource>(),
          gh<_i1015.AuthLocalDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.lazySingleton<_i421.ResetPasswordRepo>(() => _i31.ResetPasswordRepoImpl(
          gh<_i86.ResetPasswordDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i197.LoginUseCase>(
        () => _i197.LoginUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i1065.GetHomeDataUseCase>(
        () => _i1065.GetHomeDataUseCase(gh<_i242.HomeRepo>()));
    gh.factory<_i468.ResetPasswordUseCase>(
        () => _i468.ResetPasswordUseCase(gh<_i421.ResetPasswordRepo>()));
    gh.factory<_i595.HomeCubit>(() => _i595.HomeCubit(
          gh<_i1065.GetHomeDataUseCase>(),
          gh<_i533.LocationService>(),
        ));
    gh.factory<_i124.GuestUseCase>(
        () => _i124.GuestUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i336.RegisterUseCase>(
        () => _i336.RegisterUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i545.ResetPasswordCubit>(() => _i545.ResetPasswordCubit(
          gh<_i468.ResetPasswordUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i316.RegisterCubit>(() => _i316.RegisterCubit(
          gh<_i336.RegisterUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i204.LoginCubit>(() => _i204.LoginCubit(
          gh<_i197.LoginUseCase>(),
          gh<_i124.GuestUseCase>(),
        ));
    return this;
  }
}

class _$SharedPreferenceModule extends _i460.SharedPreferenceModule {}

class _$DioModule extends _i953.DioModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}
