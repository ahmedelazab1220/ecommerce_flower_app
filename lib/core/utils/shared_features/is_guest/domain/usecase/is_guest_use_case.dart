import 'package:injectable/injectable.dart';

import '../repo/is_guest_repo.dart';

@injectable
class IsGuestUseCase {
  final IsGuestRepo _isGuestRepo;
  IsGuestUseCase(this._isGuestRepo);

  Future<String?> call() async {
    return await _isGuestRepo.isGuestUser();
  }
}
