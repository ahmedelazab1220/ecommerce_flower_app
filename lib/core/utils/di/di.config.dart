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
import '../../../features/auth/domain/usecase/login_use_case.dart' as _i919;
import '../../../features/auth/presentation/view_model/login_cubit.dart'
    as _i646;
import '../../functions/initial_route_function.dart' as _i687;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../datasource_excution/api_manager.dart' as _i28;
import '../datasource_excution/dio_module.dart' as _i953;
import '../flutter_secure_storage_module.dart' as _i712;
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
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providerInterceptor());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => secureStorageModule.storage);
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i468.Validator>(() => _i468.Validator());
    gh.singleton<_i649.BlocObserverService>(
        () => _i649.BlocObserverService(gh<_i974.Logger>()));
    gh.singleton<_i257.AuthRetrofitClient>(
        () => _i257.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i687.RouteInitializer>(() => _i687.RouteInitializer(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i305.AuthRemoteDataSource>(
        () => _i212.AuthRemoteDataSourceImpl(gh<_i257.AuthRetrofitClient>()));
    gh.factory<_i1015.AuthLocalDataSource>(
        () => _i241.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i913.AuthRepo>(() => _i822.AuthRepoImpl(
          gh<_i305.AuthRemoteDataSource>(),
          gh<_i1015.AuthLocalDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i919.LoginUseCase>(
        () => _i919.LoginUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i646.LoginCubit>(() => _i646.LoginCubit(
          gh<_i919.LoginUseCase>(),
          gh<_i468.Validator>(),
        ));
    return this;
  }
}

class _$SharedPreferenceModule extends _i460.SharedPreferenceModule {}

class _$DioModule extends _i953.DioModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}
