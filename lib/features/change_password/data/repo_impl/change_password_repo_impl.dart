import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/change_password/data/data_source/contract/change_password_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/change_password/domain/entities/change_password_request_entity.dart';
import 'package:ecommerce_flower_app/features/change_password/domain/repo/change_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordRemoteDataSource _changePasswordDataSource;
  final ApiManager _apiManager;

  ChangePasswordRepoImpl(this._changePasswordDataSource, this._apiManager);

  @override
  Future<Result<void>> changePassword(ChangePasswordRequestEntity request) {
    final result = _apiManager.execute<void>(
      () async =>
          await _changePasswordDataSource.changePassword(request.toDto()),
    );
    return result;
  }
}
