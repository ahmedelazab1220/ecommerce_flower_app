import 'package:ecommerce_flower_app/features/categories/data/api/categories_retrofit_client.dart';
import 'package:ecommerce_flower_app/features/categories/data/data_source/contract/categories_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/categories/data/models/categories_response/category.dart';
import 'package:ecommerce_flower_app/features/categories/data/models/products_response/product.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final CategoriesRetrofitClient _categoriesRetrofitClient;

  CategoriesRemoteDataSourceImpl(this._categoriesRetrofitClient);

  @override
  Future<List<Category>> getCategories() async {
    final response = await _categoriesRetrofitClient.getCategories();
    return response.categories;
  }

  @override
  Future<List<Product>> getProductsByCategory({String? categoryId}) async {
    final response = await _categoriesRetrofitClient.getProductsByCategory(
      categoryId: categoryId,
    );
    return response.products;
  }
}
