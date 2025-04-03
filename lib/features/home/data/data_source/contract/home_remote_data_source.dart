import '../../models/response/home_response_dto.dart';

abstract class HomeRemoteDataSource {
  Future<HomeResponseDto> getHomeData();
}
