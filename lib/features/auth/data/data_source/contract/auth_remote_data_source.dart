import 'package:ecommerce_flower_app/features/auth/data/model/login/login_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(String email, String password);
}
