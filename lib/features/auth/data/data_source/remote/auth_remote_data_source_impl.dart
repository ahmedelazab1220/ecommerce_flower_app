import 'package:ecommerce_flower_app/features/auth/data/api/auth_retorfit_client.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../model/login/login_request_dto.dart';
import '../contract/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthRetrofitClient _authRetrofitClient;

  AuthRemoteDataSourceImpl(this._authRetrofitClient);

  @override
  Future<LoginResponseDto> login(String email, String password) async {
    return await _authRetrofitClient
        .login(LoginRequestDto(email: email, password: password));
  }
}
