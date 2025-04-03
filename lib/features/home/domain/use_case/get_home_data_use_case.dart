import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/home_response_entity.dart';
import '../repo/home_repo.dart';

@injectable
class GetHomeDataUseCase {
  final HomeRepo _homeRepo;

  GetHomeDataUseCase(this._homeRepo);

  Future<Result<HomeResponseEntity>> call() async =>
      await _homeRepo.getHomeData();
}
