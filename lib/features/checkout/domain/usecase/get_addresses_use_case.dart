import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

import '../entity/addresses_entity.dart';

@injectable
class GetAddressesUseCase {
  final CheckoutRepo _checkoutRepo;

  GetAddressesUseCase(this._checkoutRepo);

  Future<Result<List<AddressesEntity>>> call() async {
    return await _checkoutRepo.getAddresses();
  }
}
