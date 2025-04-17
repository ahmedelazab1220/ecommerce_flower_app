import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/profile/domain/entity/user_data_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/profile_repo.dart';
import '../data_source/contract/profile_local_data_source.dart';
import '../data_source/contract/profile_remote_data_source.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ApiManager _apiManager;
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;
  ProfileRepoImpl(
    this._apiManager,
    this._profileRemoteDataSource,
    this._profileLocalDataSource,
  );
  @override
  Future<Result<UserDataEntity>> getUserData() {
    var response = _apiManager.execute<UserDataEntity>(() async {
      var response = await _profileRemoteDataSource.getUserData();
      return response.user!.toEntity();
    });
    return response;
  }

  @override
  Future<Result<void>> logout() async {
    var response = _apiManager.execute<void>(() async {
      await _profileLocalDataSource.clearAll();
    });
    return response;
  }

  @override
  Future<String?> isGuestUser() async {
    return await _profileLocalDataSource.isGuestUser();
  }
}
