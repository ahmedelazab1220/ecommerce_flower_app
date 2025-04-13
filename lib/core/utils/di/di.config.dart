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

import '../../../features/auth/data/api/auth_retorfit_client.dart' as _i257;
import '../../../features/cart/data/api/cart_retrofit_client.dart' as _i675;
import '../../../features/cart/data/data_source/contract/cart_remote_datasource.dart'
    as _i12;
import '../../../features/cart/data/data_source/remote/cart_remote_datasource_impl.dart'
    as _i616;
import '../../../features/cart/data/repo_impl/cart_repo_impl.dart' as _i833;
import '../../../features/cart/domain/repo/cart_repo.dart' as _i1033;
import '../../../features/cart/domain/usecase/add_product_to_cart_usecase.dart'
    as _i1010;
import '../../../features/cart/domain/usecase/clear_cart_usecase.dart' as _i407;
import '../../../features/cart/domain/usecase/delete_product_from_cart_usecase.dart'
    as _i715;
import '../../../features/cart/domain/usecase/get_cart_usecase.dart' as _i1039;
import '../../../features/cart/domain/usecase/update_product_in_cart_usecase.dart'
    as _i637;
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
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../datasource_excution/api_manager.dart' as _i28;
import '../datasource_excution/dio_module.dart' as _i953;
import '../flutter_secure_storage_module.dart' as _i712;
import '../location_service/location_service.dart' as _i533;
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
    gh.singleton<_i533.LocationService>(() => _i533.LocationService());
    gh.singleton<_i393.MainLayoutCubit>(() => _i393.MainLayoutCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providerInterceptor());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => secureStorageModule.storage);
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i468.Validator>(() => _i468.Validator());
    gh.factory<_i493.HomeLocalDataSource>(
        () => _i640.HomeLocalDataSourceImpl());
    gh.singleton<_i649.BlocObserverService>(
        () => _i649.BlocObserverService(gh<_i974.Logger>()));
    gh.singleton<_i257.AuthRetrofitClient>(
        () => _i257.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i945.HomeRetrofitClient>(
        () => _i945.HomeRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i1043.HomeRemoteDataSource>(
        () => _i859.HomeRemoteDataSourceImpl(gh<_i945.HomeRetrofitClient>()));
    gh.singleton<_i675.CartRetrofitClient>(() => _i675.CartRetrofitClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(),
        ));
    gh.factory<_i242.HomeRepo>(() => _i801.HomeRepoImpl(
          gh<_i1043.HomeRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i12.CartRemoteDataSource>(
        () => _i616.CartRemoteDatasourceImpl(gh<_i675.CartRetrofitClient>()));
    gh.factory<_i1033.CartRepo>(() => _i833.CartRepoImpl(
          gh<_i12.CartRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i1065.GetHomeDataUseCase>(
        () => _i1065.GetHomeDataUseCase(gh<_i242.HomeRepo>()));
    gh.factory<_i595.HomeCubit>(() => _i595.HomeCubit(
          gh<_i1065.GetHomeDataUseCase>(),
          gh<_i533.LocationService>(),
        ));
    gh.factory<_i1010.AddProductToCartUsecase>(
        () => _i1010.AddProductToCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i407.ClearCartUsecase>(
        () => _i407.ClearCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i715.DeleteProductFromCartUsecase>(
        () => _i715.DeleteProductFromCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i1039.GetCartUsecase>(
        () => _i1039.GetCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i637.UpdateProductInCartUsecase>(
        () => _i637.UpdateProductInCartUsecase(gh<_i1033.CartRepo>()));
    return this;
  }
}

class _$DioModule extends _i953.DioModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}
