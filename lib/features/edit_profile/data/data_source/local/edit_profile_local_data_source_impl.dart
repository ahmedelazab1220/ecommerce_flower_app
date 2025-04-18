import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../contract/edit_profile_local_data_source.dart';

@Injectable(as: EditProfileLocalDataSource)
class EditProfileLocalDataSourceImpl implements EditProfileLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;

  EditProfileLocalDataSourceImpl(this._flutterSecureStorage);

  @override
  Future<void> saveToken(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }
}
