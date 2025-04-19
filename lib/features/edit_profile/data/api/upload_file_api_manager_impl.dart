import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import 'upload_file_api_manager.dart';

@Injectable(as: UploadFileApiManager)
class UploadFileApiManagerImpl implements UploadFileApiManager {
  final Dio _dio;

  UploadFileApiManagerImpl(this._dio);

  @override
  Future<void> uploadImage({required File image}) async {
    FormData data = FormData();
    data.files.add(
      MapEntry(
        'photo',
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('.').last,
          contentType: MediaType("image", image.path.split('.').last),
        ),
      ),
    );
    await _dio.put(
      ApiConstants.baseUrl + ApiConstants.uploadProfilePhotoRoute,
      data: data,
    );
    return;
  }
}
