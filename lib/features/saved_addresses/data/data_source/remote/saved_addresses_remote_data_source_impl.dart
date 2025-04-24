import 'package:injectable/injectable.dart';

import '../../api/saved_addresses_retrofit_client.dart';
import '../../models/delete_addresses/delete_addresses_response_dto.dart';
import '../../models/saved_addresses/saved_addresses_response_dto.dart';
import '../contract/saved_addresses_remote_data_source.dart';

@Injectable(as: SavedAddressesRemoteDataSource)
class SavedAddressesRemoteDataSourceImpl
    implements SavedAddressesRemoteDataSource {
  final SavedAddressesRetrofitClient _savedAddressesRetrofitClient;

  SavedAddressesRemoteDataSourceImpl(this._savedAddressesRetrofitClient);

  @override
  Future<SavedAddressesResponseDto> getUserSavedAddresses() async {
    var response = await _savedAddressesRetrofitClient.getSavedAddresses();
    return response;
  }

  @override
  Future<DeleteAddressesResponseDto> deleteAddress(String addressId) async {
    var response = await _savedAddressesRetrofitClient.deleteAddress(addressId);
    return response;
  }
}
