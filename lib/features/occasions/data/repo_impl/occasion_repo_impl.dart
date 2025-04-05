import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/occasions/data/occasion_data_source/occasion_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/entity/occasions_entity.dart';
import 'package:ecommerce_flower_app/features/occasions/domain/entity/products_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../domain/repo/occasion_repo.dart';

@Injectable(as: OccasionRepo)
class OccasionRepoImpl extends OccasionRepo {
  final ApiManager _apiManager;
  final OccasionRemoteDataSource _occasionRemoteDataSource;

  OccasionRepoImpl(this._apiManager, this._occasionRemoteDataSource);

  @override
  Future<Result<OccasionsEntity>> getAllOccasions() {
    var response = _apiManager.execute<OccasionsEntity>(() async {
      final response = await _occasionRemoteDataSource.getAllOccasions();
      return response.toEntity();
    });
    return response;
  }

  @override
  Future<Result<ProductsEntity>> getProductByOccasionId(String occasionId) {
    var response = _apiManager.execute<ProductsEntity>(() async {
      final response = await _occasionRemoteDataSource.getProductsByOccasion(
        occasionId,
      );
      return response.toEntity();
    });
    return response;
  }
}
