import '../../models/request/address_details_request_dto.dart';
import '../../models/response/address_details_response_dto.dart';

abstract class AddressDetailsRemoteDataSource {
  Future<AddressDetailsResponseDto> addAddressDetails(
    AddressDetailsRequestDto request,
  );
  Future<AddressDetailsResponseDto> updateAddressDetails(
    String id,
    AddressDetailsRequestDto request,
  );
}
