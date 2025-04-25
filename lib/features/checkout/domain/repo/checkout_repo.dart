import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/address_entity.dart';
import '../entity/add_order_request_entity.dart';
import '../entity/cart_entity.dart';
import '../entity/cash_order_entity/order_entity.dart';
import '../entity/credit_order_entity/add_credit_order_response_entity.dart';

abstract class CheckoutRepo {
  Future<Result<List<AddressEntity>>> getAddresses();
  Future<Result<OrderEntity?>> addCacheOrder(AddOrderRequestEntity request);
  Future<Result<AddCreditOrderResponseEntity>> addCreditOrder(
    AddOrderRequestEntity request,
  );
  Future<Result<CartEntity>> getCartInfo();
}
