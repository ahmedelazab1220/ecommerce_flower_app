import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/address_entity.dart';
import '../repo/saved_addresses_repo.dart';

@injectable
class GetUserSavedAddressesUseCase {
  final SavedAddressesRepo _savedAddressesRepo;

  GetUserSavedAddressesUseCase(this._savedAddressesRepo);

  Future<Result<List<AddressEntity>?>> call() async {
    return await _savedAddressesRepo.getUserSavedAddresses();
  }
}
