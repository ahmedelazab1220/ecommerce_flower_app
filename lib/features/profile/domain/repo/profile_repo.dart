import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/user_entity.dart';

abstract class ProfileRepo {
  Future<Result<UserEntity>> getUserData();
  Future<Result<void>> logout();
  Future<String?> isGuestUser();
}
