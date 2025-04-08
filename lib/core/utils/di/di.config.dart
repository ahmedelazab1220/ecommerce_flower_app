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

import '../../../features/auth/data/api/auth_retrofit_client.dart' as _i1048;
import '../../../features/main_layout/presentation/view_model/cubit/main_layout_cubit.dart'
    as _i393;
import '../../../features/occasions/data/api/occasion_retrofit_client.dart'
    as _i1061;
import '../../../features/occasions/data/occasion_data_source/occasion_remote_data_source.dart'
    as _i73;
import '../../../features/occasions/data/repo_impl/occasion_repo_impl.dart'
    as _i835;
import '../../../features/occasions/domain/repo/occasion_repo.dart' as _i72;
import '../../../features/occasions/domain/usecase/get_all_occasions_usecase.dart'
    as _i1056;
import '../../../features/occasions/domain/usecase/get_products_by_id_usecase.dart'
    as _i619;
import '../../../features/occasions/presentation/view_model/occasion_cubit.dart'
    as _i41;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../datasource_excution/api_manager.dart' as _i28;
import '../datasource_excution/dio_module.dart' as _i953;
import '../flutter_secure_storage_module.dart' as _i712;
import '../logging/logger_module.dart' as _i470;
import '../validator/validator.dart' as _i468;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    gh.singleton<_i28.ApiManager>(() => _i28.ApiManager());
    gh.singleton<_i393.MainLayoutCubit>(() => _i393.MainLayoutCubit());
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
    gh.singleton<_i1048.AuthRetrofitClient>(
        () => _i1048.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i1061.OccasionRetrofitClient>(
        () => _i1061.OccasionRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i73.OccasionRemoteDataSource>(() =>
        _i73.OccasionRemoteDataSource(gh<_i1061.OccasionRetrofitClient>()));
    gh.factory<_i72.OccasionRepo>(() => _i835.OccasionRepoImpl(
          gh<_i28.ApiManager>(),
          gh<_i73.OccasionRemoteDataSource>(),
        ));
    gh.factory<_i1056.GetAllOccasionsUsecase>(
        () => _i1056.GetAllOccasionsUsecase(gh<_i72.OccasionRepo>()));
    gh.factory<_i619.GetProductsByIdUsecase>(
        () => _i619.GetProductsByIdUsecase(gh<_i72.OccasionRepo>()));
    gh.factory<_i41.OccasionCubit>(() => _i41.OccasionCubit(
          gh<_i1056.GetAllOccasionsUsecase>(),
          gh<_i619.GetProductsByIdUsecase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i953.DioModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}
