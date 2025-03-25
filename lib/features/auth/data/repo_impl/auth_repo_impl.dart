import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../data_source/contract/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiManager _apiManager;
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(
      this._authRemoteDataSource, this._apiManager, this._authLocalDataSource);

  @override
  Future<void> saveToken(String key, String value) async {
    return await _authLocalDataSource.saveToken(key, value);
  }

  @override
  Future<String?> getToken(String key) async {
    return await _authLocalDataSource.getToken(key);
  }

  @override
  Future<void> deleteToken(String key) async {
    return await _authLocalDataSource.deleteToken(key);
  }

  @override
  Future<Result<LoginResponseDto>> login(String email, String password) {
    var response = _apiManager.execute<LoginResponseDto>(
      () async {
        final response = await _authRemoteDataSource.login(email, password);
        return response;
      },
    );
    return response;
  }
}
