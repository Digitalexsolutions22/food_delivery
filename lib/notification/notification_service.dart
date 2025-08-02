import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> initLocalNotifications() async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (response) {
      final payload = response.payload;
      if (payload != null) {
        // You can pass status as payload
        navigatorKey.currentContext?.goNamed('orders', extra: payload);
      }
    },
  );
}

Future<void> showLocalNotification({
  required String title,
  required String body,
  String? payload, // 👈 add this
}) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'default_channel',
    'General Notifications',
    channelDescription: 'Used for showing local notifications',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    notificationDetails,
    payload: payload, // 👈 send status here
  );
}

void setupFirebaseMessaging() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final title = message.notification?.title ?? "No Title";
    final body = message.notification?.body ?? "No Body";
    final status = message.data['status']; // 👈 extract from data
    showLocalNotification(title: title, body: body, payload: status);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    final orderId = message.data['orderId'];
    final status = message.data['status'];
    navigatorKey.currentContext?.goNamed('orders', extra: status);
  });

  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      // Handle tap when app is terminated
      final orderId = message.data['orderId'];
      final status = message.data['status'];
      navigatorKey.currentContext?.goNamed('orders', extra: status);
    }
  });
}
