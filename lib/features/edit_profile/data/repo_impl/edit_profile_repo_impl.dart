import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_manager.dart';
import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../domain/entity/edit_profile/edit_profile_request.dart';
import '../../domain/repo/edit_profile_repo.dart';
import '../data_source/contract/edit_profile_local_data_source.dart';
import '../data_source/contract/edit_profile_remote_data_source.dart';
import '../models/edit_profile/request/edit_profile_request_dto.dart';
import '../models/edit_profile/response/edit_profile_response_dto.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileRemoteDataSource _editProfileRemoteDataSource;
  final EditProfileLocalDataSource _editProfileLocalDataSource;
  final ApiManager _apiManager;

  EditProfileRepoImpl(
    this._editProfileRemoteDataSource,
    this._editProfileLocalDataSource,
    this._apiManager,
  );

  @override
  Future<Result<void>> editProfile({required EditProfileRequest request}) {
    var response = _apiManager.execute<EditProfileResponseDto>(() async {
      final response = await _editProfileRemoteDataSource.editProfile(
        request: EditProfileRequestDto.fromDomain(request),
      );
      return response;
    });
    return response;
  }

  @override
  Future<Result<void>> uploadProfileImage({required File image}) {
    var response = _apiManager.execute<void>(() async {
      final response = await _editProfileRemoteDataSource.uploadProfileImage(
        image: image,
      );
      return response;
    });
    return response;
  }
}
