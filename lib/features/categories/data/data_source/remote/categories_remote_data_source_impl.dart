import 'package:injectable/injectable.dart';

import '../../api/categories_retrofit_client.dart';
import '../../models/categories_response/category_dto.dart';
import '../../models/products_response/product_dto.dart';
import '../contract/categories_remote_data_source.dart';

@Singleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final CategoriesRetrofitClient _categoriesRetrofitClient;

  CategoriesRemoteDataSourceImpl(this._categoriesRetrofitClient);

  @override
  Future<List<CategoryDto>> getCategories() async {
    final response = await _categoriesRetrofitClient.getCategories();
    return response.categories ?? [];
  }

  @override
  Future<List<ProductDto>> getProductsByCategory({
    String? categoryId,
    int? price,
    String? sort,
  }) async {
    final response = await _categoriesRetrofitClient.getProductsByCategory(
      categoryId: categoryId,
      price: price,
      sort: sort,
    );
    return response.products ?? [];
  }
}
