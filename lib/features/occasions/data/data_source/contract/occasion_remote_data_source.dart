import '../../model/occasions_response_dto.dart';
import '../../model/products_response_dto.dart';

abstract class OccasionRemoteDataSource {
  Future<OccasionsResponseDto> getAllOccasions();

  Future<ProductsResponseDto> getProductsByOccasion(String occasionId);
}
