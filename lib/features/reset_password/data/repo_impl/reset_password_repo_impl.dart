import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/data_source/contract/reset_password_data_source.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/entities/reset_password_request_entity.dart';
import 'package:ecommerce_flower_app/features/reset_password/domain/repo/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ResetPasswordDataSource _resetPasswordDataSource;
  final ApiManager _apiManager;

  ResetPasswordRepoImpl(this._resetPasswordDataSource, this._apiManager);

  @override
  Future<Result<void>> resetPassword(ResetPasswordRequestEntity request) {
    final result = _apiManager.execute<void>(
      () async => await _resetPasswordDataSource.resetPassword(request.toDto()),
    );
    return result;
  }
}
