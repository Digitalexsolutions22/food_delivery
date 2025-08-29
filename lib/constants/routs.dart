import 'package:food_delivery/features/authentication/views/forgotpassword.dart';
import 'package:food_delivery/features/authentication/views/login.dart';
import 'package:food_delivery/features/authentication/views/signup.dart';
import 'package:food_delivery/features/authentication/views/splashscreen.dart';
import 'package:food_delivery/features/authentication/views/verificationcode.dart';
import 'package:food_delivery/features/home/views/bottomnavbar.dart';
import 'package:food_delivery/features/home/views/homescreen.dart';
import 'package:food_delivery/features/home/views/menuscreen.dart';
import 'package:food_delivery/features/plansandorders/views/cart.dart';
import 'package:food_delivery/features/profile/views/profilescreen.dart';
import 'package:food_delivery/features/plansandorders/views/myorderscren.dart';
import 'package:food_delivery/features/plansandorders/views/plans.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRoute = GoRouter(
  navigatorKey: navigatorKey,
  // initialLocation: '/home',
  routes: [
    // Non-Shell Routes
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'signup',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: 'forgotpass',
          builder: (context, state) => const ForgotPasswordScreen(),
          routes: [
            GoRoute(
              path: 'code',
              builder: (context, state) => const VerificationScreen(),
            ),
          ],
        ),
      ],
    ),

    // GoRoute(
    //   path: '/networkerror',
    //   builder: (context, state) => Networkerrorux(),
    // ),
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => Homescreen(),
        ),
        GoRoute(
          path: '/menu',
          name: 'menu',
          builder: (context, state) => MenuScreen(),
        ),
        GoRoute(
          path: '/plans',
          name: 'plans',
          builder: (context, state) => PlansScreen(),
        ),
        GoRoute(
          path: '/orders',
          name: 'orders',
          builder: (context, state) {
            final orderStatus = state.extra as String?;
            return MyorderScreen(orderStatus: orderStatus ?? 'Preparing');
          },
        ),

        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(path: '/cart', builder: (context, state) => CartSceeen()),
      ],
    ),
  ],
);
