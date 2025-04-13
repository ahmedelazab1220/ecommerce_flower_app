import 'package:ecommerce_flower_app/features/profile/data/data_source/contract/profile_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/profile/data/model/user_data_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../api/profile_retrofit_client.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileRetrofitClient _profileRetrofitClient;
  ProfileRemoteDataSourceImpl(this._profileRetrofitClient);
  @override
  Future<UserDataResponseDto> getUserData() async {
    return await _profileRetrofitClient.getUserData();
  }
}
