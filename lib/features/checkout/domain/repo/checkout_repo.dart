import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/address_entity.dart';
import '../../data/model/response/cash_order/add_cache_order_response_dto.dart';
import '../../data/model/response/credit_order/add_credit_order_response_dto.dart';
import '../entity/add_order_request_entity.dart';
import '../entity/cart_entity.dart';

abstract class CheckoutRepo {
  Future<Result<List<AddressEntity>>> getAddresses();
  Future<Result<AddCacheOrderResponseDto>> addCacheOrder(
    AddOrderRequestEntity request,
  );
  Future<Result<AddCreditOrderResponseDto>> addCreditOrder(
    AddOrderRequestEntity request,
  );
  Future<Result<CartEntity>> getCartInfo();
}
