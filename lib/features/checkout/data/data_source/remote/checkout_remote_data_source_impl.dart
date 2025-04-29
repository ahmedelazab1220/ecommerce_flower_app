import 'package:ecommerce_flower_app/features/checkout/data/api/checkout_retrofit_client.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/request/add_order_request_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/addresses/get_addresses_response_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/cart/get_cart_info_response_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/cash_order/add_cache_order_response_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/credit_order/add_credit_order_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../contract/checkout_remote_data_source.dart';

@Injectable(as: CheckoutRemoteDataSource)
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final CheckoutRetrofitClient _checkoutRetrofitClient;
  CheckoutRemoteDataSourceImpl(this._checkoutRetrofitClient);
  @override
  Future<GetAddressesResponseDto> getAddresses() async {
    return await _checkoutRetrofitClient.getAddresses();
  }

  @override
  Future<AddCacheOrderResponseDto> addCacheOrder(
    AddOrderRequestDto request,
  ) async {
    return await _checkoutRetrofitClient.addCacheOrder(request);
  }

  @override
  Future<AddCreditOrderResponseDto> addCreditOrder(
    AddOrderRequestDto request,
  ) async {
    return await _checkoutRetrofitClient.addCreditOrder(request);
  }

  @override
  Future<GetCartInfoResponseDto> getCartInfo() async {
    return await _checkoutRetrofitClient.getCartInfo();
  }
}
