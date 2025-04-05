import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/most_selling_products/domain/entity/best_seller_product_entity.dart';

abstract class BestSellerRepo {
  Future<Result<List<BestSellerProductEntity>>> getBestSellers();
}
