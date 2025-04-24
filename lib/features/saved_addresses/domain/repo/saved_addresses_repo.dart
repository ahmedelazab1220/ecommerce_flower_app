import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/address_entity.dart';

abstract class SavedAddressesRepo {
  Future<Result<List<AddressEntity>?>> getUserSavedAddresses();

  Future<Result<List<AddressEntity>?>> deleteAddress({
    required String addressId,
  });
}
