import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await _notificationsPlugin.initialize(initSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'cart_channel',
      'Sepet Bildirimi',
      description: 'Sepet hatırlatma kanalı',
      importance: Importance.max,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> showInstantNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'cart_channel',
      'Sepet Bildirimi',
      channelDescription: 'Sepet hatırlatma kanalı',
      importance: Importance.max,
      priority: Priority.high,
    );

    await _notificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(android: androidDetails),
    );
  }
}
