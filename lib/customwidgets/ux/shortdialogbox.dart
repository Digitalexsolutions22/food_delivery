import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';

class Shortdialogbox {
  static void show({
    required String message,
    required GlobalKey<NavigatorState> navigatorKey,
    Duration duration = const Duration(seconds: 5),
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: MediaQuery.of(context).padding.bottom + 40,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.black.withAlpha((255 * 0.3).round()),
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.deepGreen,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}
