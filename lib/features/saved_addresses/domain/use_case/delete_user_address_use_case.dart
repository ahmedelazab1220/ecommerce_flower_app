import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/address_entity.dart';
import '../repo/saved_addresses_repo.dart';

@injectable
class DeleteUserAddressUseCase {
  final SavedAddressesRepo _savedAddressesRepo;

  DeleteUserAddressUseCase(this._savedAddressesRepo);

  Future<Result<List<AddressEntity>?>> call({required String addressId}) async {
    return await _savedAddressesRepo.deleteAddress(addressId: addressId);
  }
}
