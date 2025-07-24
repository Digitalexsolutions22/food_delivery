import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/custom_widgets/text.dart';

BoxDecoration defaultBoxDecoration({Color borderColor = AppColors.lightGrey}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: borderColor),
  );
}

class StatusTag extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color borderColor, fontcolor;
  final double horizontalPadding;
  final double verticalPadding;

  const StatusTag({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.softGreen,
    this.borderColor = AppColors.lightGrey,
    this.horizontalPadding = 15,
    this.verticalPadding = 2,
    this.fontcolor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(555),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      child: MainBody(
        title: title,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontcolor: fontcolor,
      ),
    );
  }
}
