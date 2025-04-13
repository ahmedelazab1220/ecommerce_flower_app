import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/user_data_entity.dart';
import '../repo/profile_repo.dart';

@injectable
class GetUserDataUsecase {
  final ProfileRepo _profileRepo;

  GetUserDataUsecase(this._profileRepo);

  Future<Result<UserDataEntity>> call() async {
    return await _profileRepo.getUserData();
  }
}
