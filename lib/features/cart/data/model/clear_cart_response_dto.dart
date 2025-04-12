import 'package:json_annotation/json_annotation.dart';

part 'clear_cart_response_dto.g.dart';

@JsonSerializable()
class ClearCartResponseDto {
  @JsonKey(name: "message")
  final String? message;

  ClearCartResponseDto ({
    this.message,
  });

  factory ClearCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ClearCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ClearCartResponseDtoToJson(this);
  }
}


