import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../../constants.dart';
import '../contract/add_to_cart_local_data_source.dart';

@Injectable(as: AddToCartLocalDataSource)
class AddToCartLocalDataSourceImpl implements AddToCartLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;
  AddToCartLocalDataSourceImpl(this._flutterSecureStorage);
  @override
  Future<String?> isGuestUser() async {
    return await _flutterSecureStorage.read(key: Constants.token);
  }
}
