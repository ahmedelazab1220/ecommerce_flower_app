import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<ChangePasswordResponseDto> changePassword(
    ChangePasswordRequestDto request,
  );
}
