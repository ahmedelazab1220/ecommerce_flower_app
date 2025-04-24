import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/edit_profile/edit_profile_request.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phoneNumber;

  EditProfileRequestDto(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  );

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);

  factory EditProfileRequestDto.fromDomain(EditProfileRequest request) =>
      EditProfileRequestDto(
        request.firstName,
        request.lastName,
        request.email,
        request.phoneNumber,
      );
}
