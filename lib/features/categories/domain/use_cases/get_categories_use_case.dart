import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entities/category_entity.dart';
import '../repo/categories_repo.dart';

@injectable
class GetCategoriesUseCase {
  final CategoriesRepo _repository;

  GetCategoriesUseCase(this._repository);

  Future<Result<List<CategoryEntity>>> call() async {
    return await _repository.getCategories();
  }
}
