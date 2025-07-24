import 'package:flutter/material.dart';

class Mediahelper {
  static Brightness getBrightness(BuildContext context) {
    return MediaQuery.of(context).platformBrightness;
  }

  static bool isDarkMode(BuildContext context) {
    return getBrightness(context) == Brightness.dark;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get screen height
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Get percentage of screen width
  static double getWidthPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  // Get percentage of screen height
  static double getHeightPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  // Get device pixel ratio (useful for high-density screens)
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // Check if device is in landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Check if device is in portrait mode
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  double getResponsiveRadius(BuildContext context, double factor) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight *
        factor; // Adjust factor as needed (e.g., 0.15 for 15%)
  }
}
