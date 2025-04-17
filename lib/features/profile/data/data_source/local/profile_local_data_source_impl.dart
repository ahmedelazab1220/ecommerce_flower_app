import 'package:ecommerce_flower_app/core/utils/constants.dart';
import 'package:ecommerce_flower_app/features/profile/data/data_source/contract/profile_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;
  final SharedPreferences _sharedPreferences;
  ProfileLocalDataSourceImpl(
    this._flutterSecureStorage,
    this._sharedPreferences,
  );
  @override
  Future<void> clearAll() async {
    _sharedPreferences.clear();
    return await _flutterSecureStorage.deleteAll();
  }

  @override
  Future<String?> isGuestUser() async {
    return await _flutterSecureStorage.read(key: Constants.token);
  }
}
