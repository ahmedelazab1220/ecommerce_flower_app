import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/home_response_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/contract/home_remote_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final ApiManager _apiManager;

  HomeRepoImpl(this._homeRemoteDataSource, this._apiManager);

  @override
  Future<Result<HomeResponseEntity>> getHomeData() {
    var response = _apiManager.execute<HomeResponseEntity>(() async {
      var response = await _homeRemoteDataSource.getHomeData();
      return response.toEntity();
    });
    return response;
  }
}
