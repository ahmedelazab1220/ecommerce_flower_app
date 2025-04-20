import '../../models/request/address_details_request_dto.dart';
import '../../models/response/address_details_response_dto.dart';

abstract class AddressDetailsDataSource {
  Future<AddressDetailsResponseDto> addAddressDetails(
    AddressDetailsRequestDto request,
  );
  Future<AddressDetailsResponseDto> updateAddressDetails(
    String id,
    AddressDetailsRequestDto request,
  );
}
