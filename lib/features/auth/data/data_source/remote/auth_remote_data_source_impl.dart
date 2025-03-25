import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/api/auth_retorfit_client.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthRetrofitClient authRetrofitClient;
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.authRetrofitClient, this.apiManager);

  @override
  Future<Result<RegisterResponseDto>> signUp(
    RegisterRequestDto request,
  ) async {
    final response = await apiManager.execute<RegisterResponseDto>(
      () => authRetrofitClient.signUp(request),
    );
    return response;
  }
}
