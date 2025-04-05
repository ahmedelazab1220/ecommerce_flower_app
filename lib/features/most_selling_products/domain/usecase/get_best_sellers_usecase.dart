import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/best_seller_product_entity.dart';
import '../repo/best_seller_repo.dart';

@injectable
class GetBestSellersUsecase {
  final BestSellerRepo bestSellerRepo;

  GetBestSellersUsecase({required this.bestSellerRepo});

  Future<Result<List<BestSellerProductEntity>>> call() async {
    return await bestSellerRepo.getBestSellers();
  }
}
