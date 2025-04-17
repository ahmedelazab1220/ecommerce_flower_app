import 'package:ecommerce_flower_app/features/occasions/data/model/occasions_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../api/occasion_retrofit_client.dart';
import '../model/products_response_dto.dart';

@injectable
class OccasionRemoteDataSource {
  final OccasionRetrofitClient _occasionRetrofitClient;

  OccasionRemoteDataSource(this._occasionRetrofitClient);

  Future<OccasionsResponseDto> getAllOccasions() async {
    return await _occasionRetrofitClient.getAllOccasions();
  }

  Future<ProductsResponseDto> getProductsByOccasion(String occasionId) async {
    return await _occasionRetrofitClient.getProductsByOccasion(occasionId);
  }
}
