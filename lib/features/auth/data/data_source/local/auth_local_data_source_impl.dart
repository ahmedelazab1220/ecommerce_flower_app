import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contract/auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourceImpl(this._flutterSecureStorage, this._sharedPreferences);

  @override
  Future<void> deleteToken(String key) async {
    return await _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> getToken(String key) async {
    return await _flutterSecureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> saveToken(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<void> setRememberMe(bool value) async {
    await _sharedPreferences.setBool('isRememberMe', value);
  }

  @override
  Future<bool> isRememberMe() async {
    return _sharedPreferences.getBool('isRememberMe') ?? false;
  }
}
