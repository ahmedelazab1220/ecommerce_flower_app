class AddressesEntity {
  final String? street;
  final String? city;
  final String? lat;
  final String? long;

  AddressesEntity({
    required this.street,
    required this.city,
    required this.lat,
    required this.long,
  });

  factory AddressesEntity.fake() {
    return AddressesEntity(
      street: 'Street Placeholder',
      city: 'City Placeholder',
      lat: '0.0',
      long: '0.0',
    );
  }
}
