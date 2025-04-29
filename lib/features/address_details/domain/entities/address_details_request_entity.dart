class AddressDetailsRequestEntity {
  final String street;
  final String phone;
  final String city;
  final String lat;
  final String long;
  final String username;

  AddressDetailsRequestEntity({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
    required this.username,
  });
}
