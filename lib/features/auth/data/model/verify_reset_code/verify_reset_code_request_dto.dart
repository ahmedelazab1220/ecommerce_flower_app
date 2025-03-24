import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  VerifyResetCodeRequestDto ({
    this.resetCode,
  });

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyResetCodeRequestDtoToJson(this);
  }
}


