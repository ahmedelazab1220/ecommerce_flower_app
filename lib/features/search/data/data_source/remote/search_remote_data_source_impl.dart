import 'package:ecommerce_flower_app/features/search/data/data_source/contract/search_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/search/data/model/search_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../api/search_retrofit_client.dart';

@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final SearchRetrofitClient _searchRetrofitClient;

  SearchRemoteDataSourceImpl(this._searchRetrofitClient);

  @override
  Future<SearchResponseDto> search({required String keyword}) async {
    return await _searchRetrofitClient.search(keyword);
  }
}
