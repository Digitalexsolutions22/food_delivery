import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/routs.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.orange,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Homeprovider())],
      child: const MyApp(),
    ),
  );

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder:
  //         (context) => MultiProvider(
  //           providers: [ChangeNotifierProvider(create: (_) => Homeprovider())],
  //           child: const MyApp(),
  //         ),
  //   ),
  // );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Food delivery',
      locale: DevicePreview.locale(context), // required for DevicePreview
      builder: DevicePreview.appBuilder, // required for DevicePreview
      theme: ThemeData(),
      routerConfig: goRoute,
    );
  }
}
