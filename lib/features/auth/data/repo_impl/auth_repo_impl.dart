import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/login_request.dart';
import '../../domain/entity/register_entity/register_request_entity.dart';
import '../../domain/entity/user_enttity.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/contract/auth_local_data_source.dart';
import '../data_source/contract/auth_remote_data_source.dart';
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
      _authLocalDataSource.setGuestUser(false);
      return response;
    });
    return response;
  }

  @override
  Future<void> guestLogin() async {
    await _authLocalDataSource.setGuestUser(true);
  }

  @override
  Future<void> logout() async {
    await _authLocalDataSource.clearAll();
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
}
