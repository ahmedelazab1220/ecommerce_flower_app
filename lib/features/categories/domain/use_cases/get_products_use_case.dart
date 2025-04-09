import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/categories/domain/entities/product_entity.dart';
import 'package:ecommerce_flower_app/features/categories/domain/repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final CategoriesRepo _repository;
  GetProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>>> call({String? categoryId}) async {
    return await _repository.getProductsByCategory(categoryId: categoryId);
  }
}
