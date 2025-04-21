import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Result<List<CategoryEntity>>> getCategories();
  Future<Result<List<ProductEntity>>> getProductsByCategory({
    String? categoryId,
    int? price,
    String? sort,
  });
}
