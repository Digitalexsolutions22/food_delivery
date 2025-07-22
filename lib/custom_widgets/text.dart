import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/fonts.dart';

class BodyText extends StatelessWidget {
  final String title;
  // final String? fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontcolor;
  final bool underline;
  final TextAlign textAlign;
  final int maxlines;

  const BodyText({
    super.key,
    required this.title,
    // this.fontFamily = AppFont.inter,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = Colors.black,
    this.textAlign = TextAlign.justify,
    this.maxlines = 1,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        // fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontcolor,
        decoration: underline ? TextDecoration.underline : null,
        decorationColor: underline ? Colors.black : null,
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontcolor;
  final bool applymaxlines, underline;
  final TextAlign textAlign;
  final int maxlines;
  final double? fonthigth;

  const MainBody({
    super.key,
    required this.title,
    this.fontFamily = AppFonts.poppins,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = AppColors.black,
    this.applymaxlines = false,
    this.textAlign = TextAlign.justify,
    this.maxlines = 1,
    this.underline = false,
    this.fonthigth,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: applymaxlines ? maxlines : null,
      overflow: applymaxlines ? TextOverflow.ellipsis : null,
      style: TextStyle(
        height: fonthigth,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontcolor,
        decoration: underline ? TextDecoration.underline : null,
        decorationColor: underline ? AppColors.black : null,
      ),
    );
  }
}

class Subheader extends StatelessWidget {
  const Subheader({super.key, required this.title, this.showicon = true});
  final String title;
  final bool showicon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainBody(
          title: title,
          fontFamily: AppFonts.poppins,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        if (showicon)
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.gray,
            size: 20,
          ),
      ],
    );
  }
}
