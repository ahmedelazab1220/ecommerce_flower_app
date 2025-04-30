import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../repo/search_repo.dart';

@injectable
class SearchUsecase {
  final SearchRepo _searchRepo;

  SearchUsecase(this._searchRepo);

  Future<Result<List<ProductEntity>>> call({required String keyword}) async {
    return await _searchRepo.search(keyword: keyword);
  }
}
