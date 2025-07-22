import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/custom_widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomNavShell extends StatefulWidget {
  final Widget child;
  const BottomNavShell({super.key, required this.child});

  @override
  State<BottomNavShell> createState() => _BottomNavShellState();
}

class _BottomNavShellState extends State<BottomNavShell> {
  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/wishlist')) return 1;
    if (location.startsWith('/profile')) return 2;
    if (location.startsWith('/cart')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/wishlist');
        break;
      case 2:
        context.go('/profile');
        break;
      case 3:
        context.go('/cart');
        break;
    }
  }

  

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return  PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;

            final GoRouter router = GoRouter.of(context);
            final String location = GoRouterState.of(context).uri.path;

            log("Current Route: $location");

            if (location == '/profile' ||
                location == '/wishlist' ||
                location == '/cart') {
              router.go('/home');
              log("Redirecting to Home from Profile/Notify/Support");
              return;
            }

            if (router.canPop()) {
              router.pop();
              return;
            }

            if (location == '/home') {
              SystemNavigator.pop();
            }
          },
          child: Scaffold(
            body: widget.child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.gold,
              selectedItemColor: AppColors.blue,
              unselectedItemColor: Colors.white,
              onTap: (index) => _onItemTapped(context, index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
            ),
            floatingActionButton:
                
                     GoRouterState.of(context).uri.path.startsWith('/cart') ||
                        GoRouterState.of(
                          context,
                        ).uri.path.startsWith('/profile')
                    ? null
                    : FloatingCartButton(
               
                      onTap: () {
                        context.push('/cart');
                      }, cartCount: 1,
                    ),
          ),
        );
      
  }
}

// floating bottun

class FloatingCartButton extends StatelessWidget {
  final int cartCount;
  final VoidCallback onTap;

  const FloatingCartButton({
    super.key,
    required this.cartCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTap,
      backgroundColor: Colors.green,
      icon: Stack(
        children: [
          const Icon(Icons.shopping_cart, size: 30, color: AppColors.white),
          if (cartCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
                child: Center(
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
      label: const MainBody(title: "Go to Cart", fontcolor: AppColors.white),
    );
  }
}
