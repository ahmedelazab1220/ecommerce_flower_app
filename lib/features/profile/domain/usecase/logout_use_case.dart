import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final ProfileRepo _profileRepo;
  LogoutUseCase(this._profileRepo);
  Future<Result<void>> call() async {
    return await _profileRepo.logout();
  }
}
