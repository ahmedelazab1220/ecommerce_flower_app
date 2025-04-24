import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../entity/edit_profile/edit_profile_request.dart';
import '../repo/edit_profile_repo.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo _editProfileRepo;

  EditProfileUseCase(this._editProfileRepo);

  Future<Result<void>> call({required EditProfileRequest request}) async =>
      await _editProfileRepo.editProfile(request: request);
}
