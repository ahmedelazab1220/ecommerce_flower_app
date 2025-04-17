import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';

abstract class BestSellerRepo {
  Future<Result<List<ProductEntity>>> getBestSellers();
}
