import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/features/categories/data/data_source/contract/categories_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_flower_app/features/categories/domain/repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

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
  }) async {
    final result = await _apiManager.execute<List<ProductEntity>>(() async {
      final response = await _categoriesRemoteDataSource.getProductsByCategory(
        categoryId: categoryId,
      );
      return response.map((product) => product.toEntity()).toList();
    });

    return result;
  }
}
