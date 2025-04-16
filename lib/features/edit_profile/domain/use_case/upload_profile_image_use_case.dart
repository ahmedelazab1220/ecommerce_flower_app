import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../repo/edit_profile_repo.dart';

@injectable
class UploadProfileImageUseCase {
  final EditProfileRepo _editProfileRepo;

  UploadProfileImageUseCase(this._editProfileRepo);

  Future<Result<void>> call({required File image}) async =>
      await _editProfileRepo.uploadProfileImage(image: image);
}
