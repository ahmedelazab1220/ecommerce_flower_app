import 'package:ecommerce_flower_app/features/occasions/domain/repo/occasion_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';

@injectable
class GetProductsByIdUsecase {
  final OccasionRepo _occasionRepo;

  GetProductsByIdUsecase(this._occasionRepo);

  Future<Result<List<ProductEntity>>> call(String occasionId) async {
    return await _occasionRepo.getProductByOccasionId(occasionId);
  }
}
