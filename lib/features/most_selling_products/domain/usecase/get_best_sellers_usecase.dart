import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../repo/best_seller_repo.dart';

@injectable
class GetBestSellersUsecase {
  final BestSellerRepo _bestSellerRepo;

  GetBestSellersUsecase(this._bestSellerRepo);

  Future<Result<List<ProductEntity>>> call() async {
    return await _bestSellerRepo.getBestSellers();
  }
}
