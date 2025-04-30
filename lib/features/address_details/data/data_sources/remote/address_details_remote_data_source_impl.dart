import 'package:injectable/injectable.dart';
import '../../api/address_details_retrofit_client.dart';
import '../../models/request/address_details_request_dto.dart';
import '../../models/response/address_details_response_dto.dart';
import '../contract/address_details_remote_data_source.dart';

@LazySingleton(as: AddressDetailsRemoteDataSource)
class AddressDetailsRemoteDataSourceImpl
    implements AddressDetailsRemoteDataSource {
  final AddressDetailsRetrofitClient _retrofitClient;
  AddressDetailsRemoteDataSourceImpl(this._retrofitClient);

  @override
  Future<AddressDetailsResponseDto> addAddressDetails(
    AddressDetailsRequestDto request,
  ) async {
    return await _retrofitClient.addAddressDetails(request);
  }

  @override
  Future<AddressDetailsResponseDto> updateAddressDetails(
    String id,
    AddressDetailsRequestDto request,
  ) async {
    return await _retrofitClient.updateAddressDetails(id, request);
  }
}
