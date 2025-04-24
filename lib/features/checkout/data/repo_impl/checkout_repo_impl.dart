import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/address_entity.dart';
import '../../domain/entity/add_order_request_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/repo/checkout_repo.dart';
import '../data_source/contract/checkout_remote_data_source.dart';
import '../model/request/add_order_request_dto.dart';
import '../model/response/cash_order/add_cache_order_response_dto.dart';
import '../model/response/credit_order/add_credit_order_response_dto.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final ApiManager _apiManager;
  final CheckoutRemoteDataSource _checkoutRemoteDataSource;
  CheckoutRepoImpl(this._apiManager, this._checkoutRemoteDataSource);

  @override
  Future<Result<List<AddressEntity>>> getAddresses() async {
    return await _apiManager.execute<List<AddressEntity>>(() async {
      final response = await _checkoutRemoteDataSource.getAddresses();
      return response.addresses!.map((address) {
        return address.toEntity();
      }).toList();
    });
  }

  @override
  Future<Result<AddCacheOrderResponseDto>> addCacheOrder(
    AddOrderRequestEntity request,
  ) async {
    return await _apiManager.execute<AddCacheOrderResponseDto>(() async {
      final response = await _checkoutRemoteDataSource.addCacheOrder(
        AddOrderRequestDto.fromDomain(request),
      );
      return response;
    });
  }

  @override
  Future<Result<AddCreditOrderResponseDto>> addCreditOrder(
    AddOrderRequestEntity request,
  ) async {
    return await _apiManager.execute<AddCreditOrderResponseDto>(() async {
      final response = await _checkoutRemoteDataSource.addCreditOrder(
        AddOrderRequestDto.fromDomain(request),
      );
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
