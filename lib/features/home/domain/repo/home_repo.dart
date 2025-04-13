import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/home_response_entity.dart';

abstract class HomeRepo {
  Future<Result<HomeResponseEntity>> getHomeData();
}
