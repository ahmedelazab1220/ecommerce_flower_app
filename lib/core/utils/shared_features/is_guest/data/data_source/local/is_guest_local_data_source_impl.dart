import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../../constants.dart';
import '../contract/is_guest_local_data_source.dart';

@Injectable(as: IsGuestLocalDataSource)
class IsGuestLocalDataSourceImpl implements IsGuestLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;
  IsGuestLocalDataSourceImpl(this._flutterSecureStorage);
  @override
  Future<String?> isGuestUser() async {
    return await _flutterSecureStorage.read(key: Constants.token);
  }
}
