import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../../../core/utils/shared_models/product_entity.dart';
import '../../domain/entity/occasions_response_entity.dart';
import '../../domain/repo/occasion_repo.dart';
import '../data_source/contract/occasion_remote_data_source.dart';

@Injectable(as: OccasionRepo)
class OccasionRepoImpl implements OccasionRepo {
  final ApiManager _apiManager;
  final OccasionRemoteDataSource _occasionRemoteDataSource;

  OccasionRepoImpl(this._apiManager, this._occasionRemoteDataSource);

  @override
  Future<Result<OccasionResponseEntity>> getAllOccasions() {
    var response = _apiManager.execute<OccasionResponseEntity>(() async {
      final response = await _occasionRemoteDataSource.getAllOccasions();
      return response.toEntity();
    });
    return response;
  }

  @override
  Future<Result<List<ProductEntity>>> getProductByOccasionId(
    String occasionId,
  ) {
    var response = _apiManager.execute<List<ProductEntity>>(() async {
      final response = await _occasionRemoteDataSource.getProductsByOccasion(
        occasionId,
      );
      return response.products?.map((product) => product.toEntity()).toList() ??
          [];
    });
    return response;
  }
}
