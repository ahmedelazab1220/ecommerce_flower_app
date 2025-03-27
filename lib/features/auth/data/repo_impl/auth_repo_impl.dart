import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../data_source/contract/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiManager _apiManager = ApiManager();
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<Result<void>> login(String email, String password, bool isRememberMe) {
    var response = _apiManager.execute<LoginResponseDto>(
      () async {
        final response = await _authRemoteDataSource.login(email, password);
        _authLocalDataSource.saveToken("token", response.token ?? "");
        _authLocalDataSource.setRememberMe(isRememberMe);
        return response;
      },
    );
    return response;
  }
}
