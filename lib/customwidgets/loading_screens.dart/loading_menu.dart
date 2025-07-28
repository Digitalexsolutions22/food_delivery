import 'package:flutter/material.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:lottie/lottie.dart';

class LoadingMenu extends StatelessWidget {
  const LoadingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppImages.cartanimation,
          width: 170,
          height: 170,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        const Text(
          "Just a moment...",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
