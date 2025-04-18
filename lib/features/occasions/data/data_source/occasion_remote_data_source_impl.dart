import 'package:injectable/injectable.dart';

import '../api/occasion_retrofit_client.dart';
import '../model/occasions_response_dto.dart';
import '../model/products_response_dto.dart';
import 'contract/occasion_remote_data_source.dart';

@Injectable(as: OccasionRemoteDataSource)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSource {
  final OccasionRetrofitClient _occasionRetrofitClient;

  OccasionRemoteDataSourceImpl(this._occasionRetrofitClient);

  @override
  Future<OccasionsResponseDto> getAllOccasions() async {
    return await _occasionRetrofitClient.getAllOccasions();
  }

  @override
  Future<ProductsResponseDto> getProductsByOccasion(String occasionId) async {
    return await _occasionRetrofitClient.getProductsByOccasion(occasionId);
  }
}
