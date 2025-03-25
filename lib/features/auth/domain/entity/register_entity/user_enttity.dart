class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  final String? id;
  final List<dynamic>? addresses;
  final DateTime? createdAt;

  const UserEntity({
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
}
