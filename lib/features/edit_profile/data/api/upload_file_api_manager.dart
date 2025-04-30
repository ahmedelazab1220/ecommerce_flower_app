import 'dart:io';

abstract class UploadFileApiManager {
  Future<void> uploadImage({required File image});
}
