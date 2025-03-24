import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseDto {
  @JsonKey(name: "status")
  final String? status;

  VerifyResetCodeResponseDto ({
    this.status,
  });

  factory VerifyResetCodeResponseDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeResponseDtoToJson(this);
  }
}


