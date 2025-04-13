import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../domain/entity/login_request.dart';
import '../data_source/contract/auth_remote_data_source.dart';
import '../model/login/login_request_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiManager _apiManager;
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(
      this._authRemoteDataSource, this._authLocalDataSource, this._apiManager);

  @override
  Future<Result<void>> login(LoginRequest request) {
    var response = _apiManager.execute<LoginResponseDto>(
      () async {
        final response = await _authRemoteDataSource.login(LoginRequestDto(
          email: request.email,
          password: request.password,
        ));
        _authLocalDataSource.saveToken("token", response.token ?? "");
        _authLocalDataSource.setRememberMe(request.isRememberMe);
        _authLocalDataSource.setGuestUser(false);
        return response;
      },
    );
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
}
