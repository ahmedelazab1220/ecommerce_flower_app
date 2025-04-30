import '../../models/categories_response/category_dto.dart';
import '../../models/products_response/product_dto.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryDto>> getCategories();
  Future<List<ProductDto>> getProductsByCategory({
    String? categoryId,
    int? price,
    String? sort,
  });
}
