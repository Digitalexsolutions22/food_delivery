import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/fonts.dart';
import 'package:food_delivery/constants/routs.dart';
import 'package:food_delivery/features/authentication/provider/authprovider.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:food_delivery/notification/notification_service.dart';
import 'package:provider/provider.dart';

Future<void> _backgroundMessaging(RemoteMessage message) async {
  print("🔕 Background message: ${message.notification?.title}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission();
  await initLocalNotifications();
  setupFirebaseMessaging(); // includes foreground listener

  FirebaseMessaging.onBackgroundMessage(_backgroundMessaging);

  String? token = await FirebaseMessaging.instance.getToken();
  print("🔥 FCM Token: $token");

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.orange,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());

  // If you want to use DevicePreview with ShowCaseWidget:
  // runApp(
  //   DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  // );
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    bool isTablet = shortestSide >= 600;
    return isTablet
        ? SizedBox()
        : MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Homeprovider()),
            ChangeNotifierProvider(create: (context) => Authprovider()),
          ],
          child: Builder(
            builder:
                (context) => MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                    theme: ThemeData(fontFamily: AppFonts.poppins),
                    routerConfig: goRoute,
                  ),
                ),
          ),
        );
  }
}
