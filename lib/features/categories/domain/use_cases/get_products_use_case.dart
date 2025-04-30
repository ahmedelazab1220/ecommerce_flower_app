import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../repo/categories_repo.dart';

@injectable
class GetProductsUseCase {
  final CategoriesRepo _repository;
  GetProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>>> call({
    String? categoryId,
    int? price,
    String? sort,
  }) async {
    return await _repository.getProductsByCategory(
      categoryId: categoryId,
      price: price,
      sort: sort,
    );
  }
}
