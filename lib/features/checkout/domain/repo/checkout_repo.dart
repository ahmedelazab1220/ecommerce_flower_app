import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../../data/model/request/add_order_request_dto.dart';
import '../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../../data/model/response/credit_order/add_credit_order_response_dto.dart';
import '../entity/addresses_entity.dart';
import '../entity/cart_entity.dart';

abstract interface class CheckoutRepo {
  Future<Result<List<AddressesEntity>>> getAddresses();
  Future<Result<AddCacheOrderResponseDto>> addCacheOrder(
    AddOrderRequestDto request,
  );
  Future<Result<AddCreditOrderResponseDto>> addCreditOrder(
    AddOrderRequestDto request,
  );
  Future<Result<CartEntity>> getCartInfo();
}
