import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Result<List<CategoryEntity>>> getCategories();
  Future<Result<List<ProductEntity>>> getProductsByCategory({
    String? categoryId,
    int? price,
    String? sort,
  });
}
