import 'package:ecommerce_flower_app/core/utils/shared_api/add_to_cart/data/api/add_to_cart_retrofit_client.dart';
import 'package:ecommerce_flower_app/core/utils/shared_api/add_to_cart/data/model/response/add_to_cart_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../features/cart/data/model/add_product_to_cart_request_dto.dart';
import '../contract/add_to_cart_remote_data_source.dart';

@Injectable(as: AddToCartRemoteDataSource)
class AddToCartRemoteDataSourceImpl implements AddToCartRemoteDataSource {
  final AddToCartRetrofitClient _addToCartRetrofitClient;
  AddToCartRemoteDataSourceImpl(this._addToCartRetrofitClient);
  @override
  Future<AddToCartResponseDto> addProductToCart(
    AddProductToCartRequestDto request,
  ) async {
    return await _addToCartRetrofitClient.addProductToCart(request);
  }
}
