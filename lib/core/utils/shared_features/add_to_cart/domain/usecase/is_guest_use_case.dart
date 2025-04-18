import 'package:injectable/injectable.dart';

import '../repo/add_to_cart_repo.dart';

@injectable
class IsGuestUseCase {
  final AddToCartRepo _addToCartRepo;

  IsGuestUseCase(this._addToCartRepo);

  Future<String?> call() async {
    return await _addToCartRepo.isGuestUser();
  }
}
