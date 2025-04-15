import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contract/auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;

  AuthLocalDataSourceImpl(this._flutterSecureStorage);

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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isRememberMe', value);
  }

  @override
  Future<bool> isRememberMe() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isRememberMe') ?? false;
  }

  @override
  Future<void> clearAll() async {
    return await _flutterSecureStorage.deleteAll();
  }

  @override
  Future<void> setGuestUser(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isGuestUser', value);
  }

  @override
  Future<bool> isGuestUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isGuestUser') ?? false;
  }
}
