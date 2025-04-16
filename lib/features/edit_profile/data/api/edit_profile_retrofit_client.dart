import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../models/edit_profile/request/edit_profile_request_dto.dart';
import '../models/edit_profile/response/edit_profile_response_dto.dart';

part 'edit_profile_retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EditProfileRetrofitClient {
  @factoryMethod
  factory EditProfileRetrofitClient(Dio dio) = _EditProfileRetrofitClient;

  @PUT(ApiConstants.uploadProfilePhotoRoute)
  @MultiPart()
  Future<void> updateProfilePicture(@Part(name: "photo") File image);

  @PUT(ApiConstants.editProfileRoute)
  Future<EditProfileResponseDto> editProfile(
    @Body() EditProfileRequestDto request,
  );
}
