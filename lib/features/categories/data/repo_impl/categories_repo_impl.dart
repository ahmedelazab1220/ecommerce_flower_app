import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repo/categories_repo.dart';
import '../data_source/contract/categories_remote_data_source.dart';

@Singleton(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  final ApiManager _apiManager;
  CategoriesRepoImpl(this._categoriesRemoteDataSource, this._apiManager);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    final result = await _apiManager.execute<List<CategoryEntity>>(() async {
      final response = await _categoriesRemoteDataSource.getCategories();
      return response.map((category) => category.toEntity()).toList();
    });

    return result;
  }

  @override
  Future<Result<List<ProductEntity>>> getProductsByCategory({
    String? categoryId,
    int? price,
    String? sort,
  }) async {
    final result = await _apiManager.execute<List<ProductEntity>>(() async {
      final response = await _categoriesRemoteDataSource.getProductsByCategory(
        categoryId: categoryId,
        price: price,
        sort: sort,
      );
      return response.map((product) => product.toEntity()).toList();
    });

    return result;
  }
}
