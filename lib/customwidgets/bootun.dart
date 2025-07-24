import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class Custombutton extends StatelessWidget {
  final String title, image;
  final double size, iconhight;
  final VoidCallback? ontap;
  final BoxBorder? border;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  const Custombutton({
    super.key,
    required this.title,
    required this.image,
    this.ontap,
    this.border,
    this.color = AppColors.limeGreen,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    this.isLoading = false,
    this.size = 15,
    this.iconhight = 14,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? SizedBox(
                  height: iconhight,
                  width: iconhight,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                : Image.asset(image, height: iconhight),
            SizedBox(width: 5),
            MainBody(title: title, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}

class Custombuttom1 extends StatelessWidget {
  const Custombuttom1({super.key, required this.title, this.ontap});
  final String title;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.deepGreen,
        ),
        child: Center(
          child: MainBody(
            title: title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontcolor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
