import 'package:injectable/injectable.dart';

import '../../../../datasource_excution/api_result.dart';
import '../../data/model/request/add_to_cart_request_dto.dart';
import '../../data/model/response/add_to_cart_response_dto.dart';
import '../repo/add_to_cart_repo.dart';

@injectable
class AddToCartUseCase {
  final AddToCartRepo _addToCartRepo;

  AddToCartUseCase(this._addToCartRepo);

  Future<Result<AddToCartResponseDto>> call(AddToCartRequestDto request) async {
    return await _addToCartRepo.addToCart(request);
  }
}
