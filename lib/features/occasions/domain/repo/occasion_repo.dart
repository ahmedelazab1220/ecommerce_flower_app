import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../entity/occasions_entity.dart';
import '../entity/products_entity.dart';

abstract class OccasionRepo {
  Future<Result<OccasionsEntity>> getAllOccasions();

  Future<Result<ProductsEntity>> getProductByOccasionId(String occasionId);
}
