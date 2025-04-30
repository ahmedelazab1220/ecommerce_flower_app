import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/address_entity.dart';
import '../repo/checkout_repo.dart';

@injectable
class GetAddressesUseCase {
  final CheckoutRepo _checkoutRepo;

  GetAddressesUseCase(this._checkoutRepo);

  Future<Result<List<AddressEntity>>> call() async {
    return await _checkoutRepo.getAddresses();
  }
}
