import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contract/auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  AuthLocalDataSourceImpl(this.flutterSecureStorage);

  @override
  Future<void> deleteToken(String key) async {
    return await flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> getToken(String key) async {
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> saveToken(String key, String value) async {
    await flutterSecureStorage.write(key: key, value: value);
  }

  @override
  Future<void> setRememberMe(bool value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isRememberMe', value);
  }

  @override
  Future<bool> isRememberMe() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isRememberMe') ?? false;
  }
}
