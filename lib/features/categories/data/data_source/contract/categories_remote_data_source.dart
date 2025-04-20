import 'package:ecommerce_flower_app/features/categories/data/models/categories_response/category.dart';
import 'package:ecommerce_flower_app/features/categories/data/models/products_response/product.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProductsByCategory({
    String? categoryId,
    int? price,
    String? sort,
  });
}
