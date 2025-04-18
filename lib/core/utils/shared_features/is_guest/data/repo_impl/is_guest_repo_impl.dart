import 'package:injectable/injectable.dart';

import '../../domain/repo/is_guest_repo.dart';
import '../data_source/contract/is_guest_local_data_source.dart';

@Injectable(as: IsGuestRepo)
class IsGuestRepoImpl implements IsGuestRepo {
  final IsGuestLocalDataSource _isGuestLocalDataSource;
  IsGuestRepoImpl(this._isGuestLocalDataSource);
  @override
  Future<String?> isGuestUser() async {
    return await _isGuestLocalDataSource.isGuestUser();
  }
}
