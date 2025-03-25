import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/entity/register_entity/user_enttity.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Result<UserEntity>> signUp(RegisterRequestDto request) async {
    final result = await _authRemoteDataSource.signUp(request);

    if (result is SuccessResult<RegisterResponseDto>) {
      return SuccessResult(result.data.user.toEntity());
    } else if (result is FailureResult<RegisterResponseDto>) {
      return FailureResult(result.exception);
    } else {
      return FailureResult(Exception("Unknown error occurred"));
    }
  }
}
