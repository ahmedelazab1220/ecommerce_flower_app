import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/login/login_request.dart';
import '../../domain/entity/register/register_request_entity.dart';
import '../../domain/entity/user_enttity.dart';
import '../data_source/contract/auth_local_data_source.dart';
import '../model/login/request/login_request_dto.dart';
import '../model/login/response/login_response_dto.dart';
import '../model/register/register_request_dto/register_request_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiManager _apiManager;
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
    this._apiManager,
  );

  @override
  Future<Result<void>> login(LoginRequest request) {
    var response = _apiManager.execute<LoginResponseDto>(() async {
      final response = await _authRemoteDataSource.login(
        LoginRequestDto(email: request.email, password: request.password),
      );
      _authLocalDataSource.saveToken(Constants.token, response.token ?? "");
      _authLocalDataSource.setRememberMe(request.isRememberMe);
      _authLocalDataSource.disableGuestUser();
      return response;
    });
    return response;
  }

  @override
  Future<void> guestLogin() async {
    await _authLocalDataSource.clearAll();
    await _authLocalDataSource.enableGuestUser();
  }

  @override
  Future<bool> isGuestUser() async {
    return await _authLocalDataSource.isGuestUser();
  }

  @override
  Future<Result<UserEntity>> signUp(RegisterRequestEntity request) async {
    final result = await _apiManager.execute<UserEntity>(() async {
      final response = await _authRemoteDataSource.signUp(
        RegisterRequestDto.fromDomain(request),
      );
      return response.user?.toEntity() ?? const UserEntity();
    });
    return result;
  }

  @override
  Future<Result<void>> forgetPassword(
    ForgetPasswordRequestDto forgetPasswordRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      await _authRemoteDataSource.forgetPassword(forgetPasswordRequestDto);
    });
  }

  @override
  Future<Result<void>> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      await _authRemoteDataSource.resetPassword(resetPasswordRequestDto);
    });
  }

  @override
  Future<Result<void>> verifyResetCode(
    VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  ) async {
    return await _apiManager.execute(() async {
      await _authRemoteDataSource.verifyResetCode(verifyResetCodeRequestDto);
    });
  }
}
