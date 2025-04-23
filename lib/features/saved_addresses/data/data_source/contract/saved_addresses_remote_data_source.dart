import '../../models/delete_addresses/delete_addresses_response_dto.dart';
import '../../models/saved_addresses/saved_addresses_response_dto.dart';

abstract class SavedAddressesRemoteDataSource {
  Future<SavedAddressesResponseDto> getUserSavedAddresses();

  Future<DeleteAddressesResponseDto> deleteAddress(String addressId);
}
