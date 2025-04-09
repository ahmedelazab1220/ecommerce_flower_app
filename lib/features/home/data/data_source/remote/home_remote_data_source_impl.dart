import 'package:injectable/injectable.dart';

import '../../api/home_retrofit_client.dart';
import '../../models/response/home_response_dto.dart';
import '../contract/home_remote_data_source.dart';

@Singleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeRetrofitClient _homeRetrofitClient;

  HomeRemoteDataSourceImpl(this._homeRetrofitClient);

  @override
  Future<HomeResponseDto> getHomeData() async =>
      await _homeRetrofitClient.getHomeData();
}
