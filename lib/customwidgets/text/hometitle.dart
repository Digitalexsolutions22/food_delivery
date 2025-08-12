import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class TitleWithViewAll extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleWithViewAll({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 6),
          MainBody(title: title, fontSize: 15, fontWeight: FontWeight.bold),
          Spacer(),
          MainBody(
            title: "View All ",
            fontSize: 14,
            fontcolor: AppColors.orange,
            fontWeight: FontWeight.w500,
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.orange, size: 12),
        ],
      ),
    );
  }
}
