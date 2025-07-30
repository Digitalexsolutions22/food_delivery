import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/routs.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.orange,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  // // If you want to use DevicePreview with ShowCaseWidget:
  // runApp(
  //   DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  // );
  runApp(const MyApp());

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          providers: [ChangeNotifierProvider(create: (_) => Homeprovider())],
          child: Builder(
            builder:
                (context) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(
                      1.0,
                    ), // ✅ Locks text scaling
                  ),
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                        seedColor: AppColors.deepGreen,
                      ),
                    ),
                    routerConfig: goRoute,
                  ),
                ),
          ),
        );
  }
}
