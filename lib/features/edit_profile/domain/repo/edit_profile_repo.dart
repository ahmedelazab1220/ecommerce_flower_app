import 'dart:io';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/edit_profile/edit_profile_request.dart';

abstract class EditProfileRepo {
  Future<Result<void>> editProfile({required EditProfileRequest request});
  Future<Result<void>> uploadProfileImage({required File image});
}
