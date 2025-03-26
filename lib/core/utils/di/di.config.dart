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
import '../../../features/auth/data/data_source/contract/auth_remote_data_source.dart'
    as _i305;
import '../../../features/auth/data/data_source/implementation/auth_remote_data_source_impl.dart'
    as _i507;
import '../../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i822;
import '../../../features/auth/domain/repo/auth_repo.dart' as _i913;
import '../../../features/auth/domain/usecase/forget_password_usecase.dart'
    as _i1030;
import '../../../features/auth/domain/usecase/reset_password_usecase.dart'
    as _i280;
import '../../../features/auth/domain/usecase/verify_reset_code_usecase.dart'
    as _i967;
import '../../../features/auth/presentation/view_model/email_verification_cubit.dart'
    as _i596;
import '../../../features/auth/presentation/view_model/forget_password_cubit.dart'
    as _i504;
import '../../../features/auth/presentation/view_model/reset_password_cubit.dart'
    as _i332;
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
    gh.factory<_i305.AuthRemoteDataSource>(
        () => _i507.AuthRemoteDataSourceImpl(gh<_i257.AuthRetrofitClient>()));
    gh.factory<_i913.AuthRepo>(
        () => _i822.AuthRepoImpl(gh<_i305.AuthRemoteDataSource>()));
    gh.factory<_i1030.ForgetPasswordUsecase>(
        () => _i1030.ForgetPasswordUsecase(gh<_i913.AuthRepo>()));
    gh.factory<_i280.ResetPasswordUsecase>(
        () => _i280.ResetPasswordUsecase(gh<_i913.AuthRepo>()));
    gh.factory<_i967.VerifyResetCodeUsecase>(
        () => _i967.VerifyResetCodeUsecase(gh<_i913.AuthRepo>()));
    gh.factory<_i596.EmailVerificationCubit>(() => _i596.EmailVerificationCubit(
          gh<_i967.VerifyResetCodeUsecase>(),
          gh<_i1030.ForgetPasswordUsecase>(),
        ));
    gh.factory<_i332.ResetPasswordCubit>(
        () => _i332.ResetPasswordCubit(gh<_i280.ResetPasswordUsecase>()));
    gh.factory<_i504.ForgetPasswordCubit>(
        () => _i504.ForgetPasswordCubit(gh<_i1030.ForgetPasswordUsecase>()));
    return this;
  }
}

class _$DioModule extends _i953.DioModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}
