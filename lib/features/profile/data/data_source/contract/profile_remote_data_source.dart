import '../../model/user_data_response_dto.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserDataResponseDto> getUserData();
}
