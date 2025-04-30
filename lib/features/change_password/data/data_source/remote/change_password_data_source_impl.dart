import 'package:ecommerce_flower_app/features/change_password/data/api/change_password_retrofit_client.dart';
import 'package:ecommerce_flower_app/features/change_password/data/data_source/contract/change_password_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_request_dto/change_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/change_password/data/models/change_password_response_dto/change_password_response_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChangePasswordRemoteDataSource)
class ChangePasswordDataSourceImpl implements ChangePasswordRemoteDataSource {
  final ChangePasswordRetrofitClient _changePasswordRetrofitClient;
  ChangePasswordDataSourceImpl(this._changePasswordRetrofitClient);

  @override
  Future<ChangePasswordResponseDto> changePassword(
    ChangePasswordRequestDto request,
  ) {
    return _changePasswordRetrofitClient.changePassword(request);
  }
}
