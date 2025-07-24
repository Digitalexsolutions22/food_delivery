import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:go_router/go_router.dart';

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
    if (location.startsWith('/menu')) return 1;
    if (location.startsWith('/plans')) return 2;
    if (location.startsWith('/orders')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/menu');
        break;
      case 2:
        context.go('/plans');
        break;
      case 3:
        context.go('/orders');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final GoRouter router = GoRouter.of(context);
        final String location = GoRouterState.of(context).uri.path;

        log("Current Route: $location");

        if (location != '/home') {
          router.go('/home');
          log("Redirecting to Home");
          return;
        }

        SystemNavigator.pop();
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppColors.orange,
            unselectedItemColor: Colors.black54,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(fontSize: 0, height: 0),
            unselectedLabelStyle: const TextStyle(fontSize: 0, height: 0),
            onTap: (index) => _onItemTapped(context, index),
            items: [
              _buildBottomNavItem(
                icon: Icons.home,
                label: 'Home',
                isSelected: currentIndex == 0,
              ),
              _buildBottomNavItem(
                icon: Icons.restaurant_menu,
                label: 'Menu',
                isSelected: currentIndex == 1,
              ),
              _buildBottomNavItem(
                icon: Icons.event_note,
                label: 'Plans',
                isSelected: currentIndex == 2,
              ),
              _buildBottomNavItem(
                icon: Icons.list_alt,
                label: 'Orders',
                isSelected: currentIndex == 3,
              ),
              _buildBottomNavItem(
                icon: Icons.person,
                label: 'Profile',
                isSelected: currentIndex == 4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingCartButton(
          onTap: () {
            context.push('/orders');
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              isSelected
                  ? AppColors.orange.withOpacity(0.1)
                  : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? AppColors.orange : Colors.black87,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.orange : Colors.black87,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}

class FloatingCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onTap,
      backgroundColor: AppColors.orange,
      child: const Icon(Icons.shopping_cart, color: AppColors.white, size: 28),
    );
  }
}
