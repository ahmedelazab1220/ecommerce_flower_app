import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GuestUseCase {
  final AuthRepo _authRepo;
  GuestUseCase(this._authRepo);

  Future<void> call() async {
    await _authRepo.guestLogin();
  }
}
