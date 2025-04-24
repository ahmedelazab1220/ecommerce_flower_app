import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_constants.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/request/address_details_request_dto.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/response/address_details_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'address_details_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AddressDetailsRetrofitClient {
  @factoryMethod
  factory AddressDetailsRetrofitClient(Dio dio) = _AddressDetailsRetrofitClient;

  @PATCH(ApiConstants.addressesRoute)
  Future<AddressDetailsResponseDto> addAddressDetails(
    @Body() AddressDetailsRequestDto request,
  );

  @PATCH("${ApiConstants.addressesRoute}/{id}")
  Future<AddressDetailsResponseDto> updateAddressDetails(
    @Path("id") String id,
    @Body() AddressDetailsRequestDto request,
  );
}
