import 'package:firebase_messaging/firebase_messaging.dart';

import '../core/assets/app_colors.dart';
import '../core/utils/dialogs/app_toast.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showToast(
        title: message.notification?.title ?? "New notification received",
        color: AppColors.white,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      showToast(
        title:
            "Notification clicked: ${message.notification?.title ?? "Unknown"}",
        color: AppColors.white,
      );
    });
  }
}
