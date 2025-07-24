import 'package:flutter/material.dart';
import 'package:food_delivery/features/home/bottomnavbar.dart';
import 'package:food_delivery/features/home/homescreen.dart';
import 'package:food_delivery/features/home/profile/profilescreen.dart';
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
          builder: (context, state) => MenuPage(),
        ),
        GoRoute(
          path: '/plans',
          name: 'plans',
          builder: (context, state) => PlansPage(),
        ),
        GoRoute(
          path: '/orders',
          name: 'orders',
          builder: (context, state) => OrdersPage(),
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

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Menu Page')));
  }
}

class PlansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Plans Page')));
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Orders Page')));
  }
}
