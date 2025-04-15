import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../entity/user_data_entity.dart';

abstract interface class ProfileRepo {
  Future<Result<UserDataEntity>> getUserData();
  Future<Result<void>> logout();
}
