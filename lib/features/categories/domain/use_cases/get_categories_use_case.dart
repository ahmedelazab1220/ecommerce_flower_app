import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_flower_app/features/categories/domain/repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetCategoriesUseCase {
  final CategoriesRepo _repository;

  GetCategoriesUseCase(this._repository);

  Future<Result<List<CategoryEntity>>> call() async {
    return await _repository.getCategories();
  }
}
