import 'package:ecommerce_flower_app/features/auth/data/api/auth_retorfit_client.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_request_dto/register_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/register/register_response_dto/register_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthRetrofitClient authRetrofitClient;

  AuthRemoteDataSourceImpl(this.authRetrofitClient);

  @override
  Future<RegisterResponseDto> signUp(RegisterRequestDto request) async {
    final response = authRetrofitClient.signUp(request);

    return response;
  }
}
