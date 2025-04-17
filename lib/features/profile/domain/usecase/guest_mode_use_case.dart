import 'package:ecommerce_flower_app/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GuestModeUseCase {
  final ProfileRepo _profileRepo;
  GuestModeUseCase(this._profileRepo);

  Future<String?> call() async {
    return await _profileRepo.isGuestUser();
  }
}
