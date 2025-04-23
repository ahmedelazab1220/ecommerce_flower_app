import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/request/add_order_request_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/cash_order/add_cache_order_response_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/data/model/response/credit_order/add_credit_order_response_dto.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/entity/addresses_entity.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/entity/cart_entity.dart';
import 'package:ecommerce_flower_app/features/checkout/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/contract/checkout_remote_data_source.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final ApiManager _apiManager;
  final CheckoutRemoteDataSource _checkoutRemoteDataSource;
  CheckoutRepoImpl(this._apiManager, this._checkoutRemoteDataSource);

  @override
  Future<Result<List<AddressesEntity>>> getAddresses() async {
    return await _apiManager.execute<List<AddressesEntity>>(() async {
      final response = await _checkoutRemoteDataSource.getAddresses();
      return response.addresses!.map((address) {
        return address.toEntity();
      }).toList();
    });
  }

  @override
  Future<Result<AddCacheOrderResponseDto>> addCacheOrder(
    AddOrderRequestDto request,
  ) async {
    return await _apiManager.execute<AddCacheOrderResponseDto>(() async {
      final response = await _checkoutRemoteDataSource.addCacheOrder(request);
      return response;
    });
  }

  @override
  Future<Result<AddCreditOrderResponseDto>> addCreditOrder(
    AddOrderRequestDto request,
  ) async {
    return await _apiManager.execute<AddCreditOrderResponseDto>(() async {
      final response = await _checkoutRemoteDataSource.addCreditOrder(request);
      return response;
    });
  }

  @override
  Future<Result<CartEntity>> getCartInfo() async {
    return await _apiManager.execute<CartEntity>(() async {
      final response = await _checkoutRemoteDataSource.getCartInfo();
      return response.cart!.toEntity();
    });
  }
}
