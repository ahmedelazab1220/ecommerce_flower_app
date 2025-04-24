import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../api/edit_profile_retrofit_client.dart';
import '../../api/upload_file_api_manager.dart';
import '../../models/edit_profile/request/edit_profile_request_dto.dart';
import '../../models/edit_profile/response/edit_profile_response_dto.dart';
import '../contract/edit_profile_remote_data_source.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final EditProfileRetrofitClient _editProfileRetrofitClient;
  final UploadFileApiManager _uploadFileApiManager;

  EditProfileRemoteDataSourceImpl(
    this._editProfileRetrofitClient,
    this._uploadFileApiManager,
  );

  @override
  Future<void> uploadProfileImage({required File image}) {
    var response = _uploadFileApiManager.uploadImage(image: image);
    return response;
  }

  @override
  Future<EditProfileResponseDto> editProfile({
    required EditProfileRequestDto request,
  }) {
    var response = _editProfileRetrofitClient.editProfile(request);
    return response;
  }
}
