import '../../model/login/request/login_request_dto.dart';
import '../../model/login/response/login_response_dto.dart';
import '../../model/register/register_request_dto/register_request_dto.dart';
import '../../model/register/register_response_dto/register_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
  Future<RegisterResponseDto> signUp(RegisterRequestDto request);
}
