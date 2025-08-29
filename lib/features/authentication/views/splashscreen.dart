import 'package:flutter/material.dart';
import 'package:food_delivery/features/authentication/provider/authprovider.dart';
import 'package:lottie/lottie.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Authprovider>().openLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        height: double.infinity,
        width: double.infinity,
        AppImages.rocketanimation,
        // height: 250,
        fit: BoxFit.fill,
      ),
    );
  }
}
