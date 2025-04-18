import 'package:injectable/injectable.dart';
import '../../api/auth_retrofit_client.dart';
import '../../model/login/request/login_request_dto.dart';
import '../../model/login/response/login_response_dto.dart';
import '../../model/register/register_request_dto/register_request_dto.dart';
import '../../model/register/register_response_dto/register_response_dto.dart';
import '../contract/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthRetrofitClient _authRetrofitClient;

  AuthRemoteDataSourceImpl(this._authRetrofitClient);

  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    return await _authRetrofitClient.login(request);
  }

  @override
  Future<RegisterResponseDto> signUp(RegisterRequestDto request) async {
    final response = await _authRetrofitClient.signUp(request);

    return response;
  }
}
