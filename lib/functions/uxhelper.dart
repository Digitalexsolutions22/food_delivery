import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/main.dart';

class TopMessageDialog {
  static void show({
    required String message,
    Color backgroundColor = AppColors.blueLight,
    Duration duration = const Duration(seconds: 5),
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top:
              MediaQueryData.fromView(
                View.of(navigatorKey.currentContext!),
              ).padding.top +
              10,
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                message,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
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

class NoDatatext extends StatelessWidget {
  final String? text;
  const NoDatatext({this.text = "Oops! The data is not there", super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: MainBody(
          textAlign: TextAlign.center,
          title: text.toString(),
          fontSize: 18,
          fontcolor: AppColors.gray.withOpacity(0.8),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BootmMessageDialog {
  static void show({
    required String message,
    Duration duration = const Duration(seconds: 5),
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom:
              MediaQuery.of(context).padding.bottom +
              20, // At the top of the screen
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(555),
                color: AppColors.black.withOpacity(0.9),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );

    // Insert the overlay entry
    overlay.insert(overlayEntry);

    // Remove the overlay after the duration
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

String daysLeftMessage(String targetDate) {
  final now = DateTime.now();
  final target = DateTime.parse(targetDate);
  final diff = target.difference(DateTime(now.year, now.month, now.day)).inDays;

  if (diff > 0) return "$diff days left";
  if (diff == 0) return "Expires today";
  return "Expired ${diff.abs()} days ago";
}
