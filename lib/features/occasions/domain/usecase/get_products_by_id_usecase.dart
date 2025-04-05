import 'package:ecommerce_flower_app/features/occasions/domain/repo/occasion_repo.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/products_entity.dart';

class GetProductsByIdUsecase {
  final OccasionRepo _occasionRepo;

  GetProductsByIdUsecase(this._occasionRepo);

  Future<Result<ProductsEntity>> call(String occasionId) async {
    return await _occasionRepo.getProductByOccasionId(occasionId);
  }
}
