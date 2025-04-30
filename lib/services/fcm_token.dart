import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationServiceToken {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();

    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      await _secureStorage.write(key: "fcm_token", value: token);
    }
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: "fcm_token");
  }
}

Future<void> sendTokenToServer(String token) async {
  // retrofit
}
