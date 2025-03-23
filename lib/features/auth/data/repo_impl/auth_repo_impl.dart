import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../data_source/contract/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiManager _apiManager;
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource, this._apiManager);

  @override
  Future<void> saveToken(String token) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }

  @override
  Future<String?> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    throw UnimplementedError();
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
