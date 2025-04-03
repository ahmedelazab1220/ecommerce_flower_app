import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/register_request_entity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final ApiManager apiManager;

  AuthRepoImpl(this._authRemoteDataSource, this.apiManager);

  @override
  Future<Result<UserEntity>> signUp(RegisterRequestEntity request) async {
    final result = await apiManager.execute<RegisterResponseDto>(
      () => _authRemoteDataSource.signUp(request.toDto(request)),
    );

    switch (result) {
      case SuccessResult<RegisterResponseDto>():
        return SuccessResult<UserEntity>(result.data.toEntity().user);
      case FailureResult<RegisterResponseDto>():
        return FailureResult<UserEntity>(result.exception);
    }
  }
}
