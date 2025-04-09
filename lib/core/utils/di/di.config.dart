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
import '../../../features/main_layout/presentation/view_model/cubit/main_layout_cubit.dart'
    as _i393;
import '../../../features/most_selling_products/data/api/best_seller_retrofit_client.dart'
    as _i821;
import '../../../features/most_selling_products/data/data_source/contract/best_seller_remote_data_source.dart'
    as _i488;
import '../../../features/most_selling_products/data/data_source/remote/best_seller_remote_data_source_impl.dart'
    as _i461;
import '../../../features/most_selling_products/data/repo_impl/best_seller_repo_impl.dart'
    as _i688;
import '../../../features/most_selling_products/domain/repo/best_seller_repo.dart'
    as _i58;
import '../../../features/most_selling_products/domain/usecase/get_best_sellers_usecase.dart'
    as _i109;
import '../../../features/most_selling_products/presentation/view_model/best_seller_cubit.dart'
    as _i190;
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
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    gh.singleton<_i28.ApiManager>(() => _i28.ApiManager());
    gh.singleton<_i393.MainLayoutCubit>(() => _i393.MainLayoutCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providerInterceptor(),
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.storage,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i468.Validator>(() => _i468.Validator());
    gh.singleton<_i649.BlocObserverService>(
      () => _i649.BlocObserverService(gh<_i974.Logger>()),
    );
    gh.singleton<_i257.AuthRetrofitClient>(
      () => _i257.AuthRetrofitClient(gh<_i361.Dio>()),
    );
    gh.singleton<_i821.BestSellerRetrofitClient>(
      () => _i821.BestSellerRetrofitClient(gh<_i361.Dio>()),
    );
    gh.factory<_i488.BestSellerRemoteDataSource>(
      () => _i461.BestSellerRemoteDataSourceImpl(
        gh<_i821.BestSellerRetrofitClient>(),
      ),
    );
    gh.factory<_i58.BestSellerRepo>(
      () => _i688.BestSellerRepoImpl(gh<_i488.BestSellerRemoteDataSource>()),
    );
    gh.factory<_i109.GetBestSellersUsecase>(
      () => _i109.GetBestSellersUsecase(gh<_i58.BestSellerRepo>()),
    );
    gh.factory<_i190.BestSellerCubit>(
      () => _i190.BestSellerCubit(gh<_i109.GetBestSellersUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i953.DioModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}
