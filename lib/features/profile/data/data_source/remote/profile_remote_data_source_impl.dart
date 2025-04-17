import 'package:injectable/injectable.dart';

import '../../api/profile_retrofit_client.dart';
import '../../model/user_data_response_dto.dart';
import '../contract/profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileRetrofitClient _profileRetrofitClient;

  ProfileRemoteDataSourceImpl(this._profileRetrofitClient);

  @override
  Future<UserDataResponseDto> getUserData() async {
    var response = await _profileRetrofitClient.getUserData();
    return response;
  }
}
