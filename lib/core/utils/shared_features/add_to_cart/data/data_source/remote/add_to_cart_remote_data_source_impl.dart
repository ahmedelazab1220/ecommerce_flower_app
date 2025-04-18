import 'package:injectable/injectable.dart';

import '../../api/add_to_cart_retrofit_client.dart';
import '../../model/request/add_to_cart_request_dto.dart';
import '../../model/response/add_to_cart_response_dto.dart';
import '../contract/add_to_cart_remote_data_source.dart';

@Injectable(as: AddToCartRemoteDataSource)
class AddToCartRemoteDataSourceImpl implements AddToCartRemoteDataSource {
  final AddToCartRetrofitClient _addToCartRetrofitClient;
  AddToCartRemoteDataSourceImpl(this._addToCartRetrofitClient);
  @override
  Future<AddToCartResponseDto> addProductToCart(
    AddToCartRequestDto request,
  ) async {
    return await _addToCartRetrofitClient.addProductToCart(request);
  }
}
