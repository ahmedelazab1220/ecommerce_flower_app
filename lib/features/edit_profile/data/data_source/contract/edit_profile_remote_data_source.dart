import 'dart:io';

import '../../models/edit_profile/request/edit_profile_request_dto.dart';
import '../../models/edit_profile/response/edit_profile_response_dto.dart';

abstract class EditProfileRemoteDataSource {
  Future<void> uploadProfileImage({required File image});

  Future<EditProfileResponseDto> editProfile({
    required EditProfileRequestDto request,
  });
}
