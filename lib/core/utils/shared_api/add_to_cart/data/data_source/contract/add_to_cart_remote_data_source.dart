import '../../model/request/add_to_cart_request_dto.dart';
import '../../model/response/add_to_cart_response_dto.dart';

abstract interface class AddToCartRemoteDataSource {
  Future<AddToCartResponseDto> addProductToCart(AddToCartRequestDto request);
}
