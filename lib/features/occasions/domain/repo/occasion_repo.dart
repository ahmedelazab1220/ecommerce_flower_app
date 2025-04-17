import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../../../../core/utils/shared_models/product_entity.dart';
import '../entity/occasions_entity.dart';

abstract interface class OccasionRepo {
  Future<Result<OccasionsEntity>> getAllOccasions();

  Future<Result<List<ProductEntity>>> getProductByOccasionId(String occasionId);
}
