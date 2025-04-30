import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/address_details_request_entity.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/city_entity.dart';
import 'package:ecommerce_flower_app/features/address_details/domain/entities/state_entity.dart';

abstract class AddressDetailsRepo {
  Future<Result<void>> addAddressDetails(AddressDetailsRequestEntity request);
  Future<Result<void>> updateAddressDetails(
    String id,
    AddressDetailsRequestEntity request,
  );
  Future<Result<List<CityEntity>>> getCities();
  Future<Result<List<StateEntity>>> getState();
}
