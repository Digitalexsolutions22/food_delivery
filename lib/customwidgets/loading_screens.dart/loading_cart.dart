import 'package:flutter/material.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:lottie/lottie.dart';

class LoadingCart extends StatelessWidget {
  const LoadingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImages.foodpreparedanimation,
            width: 170,
            height: 170,

            fit: BoxFit.contain, // or BoxFit.fill, BoxFit.cover
          ),
          const Text(
            "Loading your delicious selections.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
