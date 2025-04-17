import 'package:ecommerce_flower_app/core/utils/constants.dart';
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
    _sharedPreferences.setBool(Constants.isRememberMe, value);
  }

  @override
  Future<bool> isRememberMe() async {
    return _sharedPreferences.getBool(Constants.isRememberMe) ?? false;
  }

  @override
  Future<void> clearAll() async {
    return await _flutterSecureStorage.deleteAll();
  }

  @override
  Future<void> setGuestUser(bool value) async {
    _sharedPreferences.setBool(Constants.isGuestUser, value);
  }

  @override
  Future<bool> isGuestUser() async {
    return _sharedPreferences.getBool(Constants.isGuestUser) ?? false;
  }
}
