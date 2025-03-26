import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  @JsonKey(name: '_id')
  final String? id;
  final List<dynamic>? addresses;
  final DateTime? createdAt;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      wishlist: wishlist,
      id: id,
      addresses: addresses,
      createdAt: createdAt,
    );
  }
}
