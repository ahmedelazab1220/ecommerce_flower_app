import 'package:ecommerce_flower_app/features/auth/data/model/login/request/login_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/login/response/login_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
}
