import "package:firebase_messaging/firebase_messaging.dart";

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    ('Handling a background message ${message.messageId}');
  }

  Future<void> initializeFirebase() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final token = await _firebaseMessaging.getToken();
    ('Token: $token');
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage(message));
  }
}
