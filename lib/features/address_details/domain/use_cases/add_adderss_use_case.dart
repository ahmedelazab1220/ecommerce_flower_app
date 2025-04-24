import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/address_details_request_entity.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/repo/address_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressUseCase {
  final AddressDetailsRepo _repo;
  AddAddressUseCase(this._repo);

  Future<Result<void>> call(AddressDetailsRequestEntity request) async {
    return await _repo.addAddressDetails(request);
  }
}
