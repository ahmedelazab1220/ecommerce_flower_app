import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "wishlist")
  final List<dynamic>? wishlist;
  @JsonKey(name: "addresses")
  final List<dynamic>? addresses;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;

  UserDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserEntity toEntity() => UserEntity(
    firstName: firstName,
    lastName: lastName,
    email: email,
    photo: photo,
    gender: gender,
    phone: phone,
  );
}
