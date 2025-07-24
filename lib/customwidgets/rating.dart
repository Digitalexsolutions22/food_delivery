import 'package:flutter/material.dart';
import 'package:food_delivery/constants/images.dart';

class StarRating extends StatelessWidget {
  final double rating; // rating between 1.0 to 5.0
  final double size;

  const StarRating({super.key, required this.rating, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    // Round to nearest 0.5
    double adjustedRating = (rating * 2).round() / 2;

    for (int i = 1; i <= 5; i++) {
      if (adjustedRating >= i) {
        // Full star
        stars.add(_buildStar(AppImages.fullistar));
      } else if (adjustedRating == i - 0.5) {
        // Half star
        stars.add(_buildStar(AppImages.halfstar));
      } else {
        // Empty star
        stars.add(_buildStar(AppImages.nostar));
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }

  Widget _buildStar(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
