import 'package:food_delivery/features/home/views/bottomnavbar.dart';
import 'package:food_delivery/features/home/views/homescreen.dart';
import 'package:food_delivery/features/home/views/menuscreen.dart';
import 'package:food_delivery/features/home/profile/profilescreen.dart';
import 'package:food_delivery/features/plansandorders/views/myorderscren.dart';
import 'package:food_delivery/features/plansandorders/views/plans.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRoute = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/home',
  routes: [
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
          builder: (context, state) => MyorderScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => ProfileScreen(),
        ),
      ],
    ),
  ],
);
