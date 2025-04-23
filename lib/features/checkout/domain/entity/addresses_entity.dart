class AddressesEntity {
  final String? street;
  final String? city;
  final String? lat;
  final String? long;
  final String? phone;

  AddressesEntity({
    required this.street,
    required this.city,
    required this.lat,
    required this.long,
    required this.phone,
  });

  factory AddressesEntity.fake() {
    return AddressesEntity(
      street: 'Street Placeholder',
      city: 'City Placeholder',
      lat: '0.0',
      long: '0.0',
      phone: '1234567890',
    );
  }
}
