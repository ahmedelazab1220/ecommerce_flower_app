import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/add_to_cart_repo.dart';
import '../data_source/contract/add_to_cart_local_data_source.dart';
import '../data_source/contract/add_to_cart_remote_data_source.dart';
import '../model/request/add_to_cart_request_dto.dart';
import '../model/response/add_to_cart_response_dto.dart';

@Injectable(as: AddToCartRepo)
class AddToCartRepoImpl implements AddToCartRepo {
  final ApiManager _apiManager;
  final AddToCartRemoteDataSource _addToCartRemoteDataSource;
  final AddToCartLocalDataSource _addToCartLocalDataSource;
  AddToCartRepoImpl(
    this._apiManager,
    this._addToCartRemoteDataSource,
    this._addToCartLocalDataSource,
  );
  @override
  Future<Result<AddToCartResponseDto>> addToCart(
    AddToCartRequestDto request,
  ) async {
    return await _apiManager.execute<AddToCartResponseDto>(() async {
      final response = await _addToCartRemoteDataSource.addProductToCart(
        request,
      );
      return response;
    });
  }

  @override
  Future<String?> isGuestUser() async {
    return await _addToCartLocalDataSource.isGuestUser();
  }
}
