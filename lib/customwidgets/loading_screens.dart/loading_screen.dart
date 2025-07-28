import 'package:flutter/material.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppImages.menuanimation,
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        const Text(
          "Just a moment...",
          style: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
