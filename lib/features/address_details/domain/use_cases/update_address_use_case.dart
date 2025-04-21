import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';
import '../entities/address_details_request_entity.dart';
import '../repo/address_details_repo.dart';

@injectable
class UpdateAddressUseCase {
  final AddressDetailsRepo _repo;

  UpdateAddressUseCase(this._repo);

  Future<Result<void>> call(
    String id,
    AddressDetailsRequestEntity request,
  ) async {
    return await _repo.updateAddressDetails(id, request);
  }
}
