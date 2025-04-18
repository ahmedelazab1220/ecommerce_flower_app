import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../../../../../../features/cart/data/model/add_product_to_cart_request_dto.dart';
import '../../data/model/response/add_to_cart_response_dto.dart';

abstract interface class AddToCartRepo {
  Future<Result<AddToCartResponseDto>> addToCart(
    AddProductToCartRequestDto request,
  );
}
