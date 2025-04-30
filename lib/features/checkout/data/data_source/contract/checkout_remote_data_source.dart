import '../../model/request/add_order_request_dto.dart';
import '../../model/response/addresses/get_addresses_response_dto.dart';
import '../../model/response/cart/get_cart_info_response_dto.dart';
import '../../model/response/cash_order/add_cache_order_response_dto.dart';
import '../../model/response/credit_order/add_credit_order_response_dto.dart';

abstract interface class CheckoutRemoteDataSource {
  Future<GetAddressesResponseDto> getAddresses();
  Future<AddCacheOrderResponseDto> addCacheOrder(AddOrderRequestDto request);
  Future<AddCreditOrderResponseDto> addCreditOrder(AddOrderRequestDto request);
  Future<GetCartInfoResponseDto> getCartInfo();
}
