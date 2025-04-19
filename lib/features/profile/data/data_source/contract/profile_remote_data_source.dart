import '../../model/user_data_response_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<UserDataResponseDto> getUserData();
}
