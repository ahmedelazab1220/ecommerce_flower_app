import '../../model/search_response_dto.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResponseDto> search({required String keyword});
}
