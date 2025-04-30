import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/shared_models/product_entity.dart';
import 'package:ecommerce_flower_app/features/search/domain/repo/search_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/contract/search_remote_data_source.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final ApiManager _apiManager;
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepoImpl(this._searchRemoteDataSource, this._apiManager);

  @override
  Future<Result<List<ProductEntity>>> search({required String keyword}) async {
    return _apiManager.execute(() async {
      final response = await _searchRemoteDataSource.search(keyword: keyword);
      return response.products!.map((e) => e.toEntity()).toList();
    });
  }
}
