import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              AppImages.emptycart,
              height: 160,
              color: AppColors.orangeYellow,
            ),
            SizedBox(height: 20),
            MainBody(
              title: "Your Cart is empty",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4),
            MainBody(title: "Add something tasty"),
            SizedBox(height: 40),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.yellowTransparent,
              ),
              child: Center(
                child: MainBody(
                  title: "Browse Menu",
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontcolor: AppColors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
