import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../contract/auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final flutterSecureStorage = FlutterSecureStorage();
  @override
  Future<void> deleteToken(String key) async {
    Logger().d("FlutterSecureStorage : deleteSecuredString with key : $key");
    return await flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> getToken(String key) async {
    Logger().d("FlutterSecureStorage : getSecuredString with key : $key");
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> saveToken(String key, String value) async {
    Logger().d(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }
}
