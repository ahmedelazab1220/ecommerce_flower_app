import 'package:ecommerce_flower_app/features/reset_password/data/api/reset_password_retrofit_client.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/data_source/contract/reset_password_data_source.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_request_dto/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/reset_password/data/models/reset_password_response_dto/reset_password_response_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResetPasswordDataSource)
class ResetPasswordDataSourceImpl implements ResetPasswordDataSource {
  final ResetPasswordRetrofitClient _resetPasswordRetrofitClient;
  ResetPasswordDataSourceImpl(this._resetPasswordRetrofitClient);

  @override
  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestDto request,
  ) {
    return _resetPasswordRetrofitClient.resetPassword(request);
  }
}
