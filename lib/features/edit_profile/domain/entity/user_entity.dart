class UserEntity {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String? role;
  final List<dynamic>? wishlist;
  final List<dynamic>? addresses;
  final String? createdAt;

  UserEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  });
}
