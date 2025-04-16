import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../user_dto.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDto {
  final String? message;
  final UserDto? user;
  final String? token;

  const RegisterResponseDto({
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseDtoToJson(this);

  RegisterEntity toEntity() {
    return RegisterEntity(message: message, user: user!.toEntity());
  }
}
