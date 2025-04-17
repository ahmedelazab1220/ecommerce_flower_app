import 'package:ecommerce_flower_app/features/profile/data/data_source/contract/profile_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;
  ProfileLocalDataSourceImpl(this._flutterSecureStorage);
  @override
  Future<void> clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return await _flutterSecureStorage.deleteAll();
  }

  @override
  Future<String?> isGuestUser() async {
    return await _flutterSecureStorage.read(key: "token");
  }
}
