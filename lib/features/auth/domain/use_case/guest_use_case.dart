import 'package:injectable/injectable.dart';

import '../repo/auth_repo.dart';

@injectable
class GuestUseCase {
  final AuthRepo _authRepo;
  GuestUseCase(this._authRepo);

  Future<void> call() async {
    await _authRepo.guestLogin();
  }
}
