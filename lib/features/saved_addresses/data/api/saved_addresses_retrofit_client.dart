import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../models/delete_addresses/delete_addresses_response_dto.dart';
import '../models/saved_addresses/saved_addresses_response_dto.dart';

part 'saved_addresses_retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SavedAddressesRetrofitClient {
  @factoryMethod
  factory SavedAddressesRetrofitClient(Dio dio) = _SavedAddressesRetrofitClient;

  @GET(ApiConstants.addressesRoute)
  Future<SavedAddressesResponseDto> getSavedAddresses();

  @DELETE("${ApiConstants.addressesRoute}/{addressId}")
  Future<DeleteAddressesResponseDto> deleteAddress(
    @Path("addressId") String addressId,
  );
}
