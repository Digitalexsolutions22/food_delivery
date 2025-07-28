import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/features/home/views/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Homeprovider extends ChangeNotifier {
  bool locationloading = false;
  String result = "Press button to check distances";

  final List<Restaurant> restaurants = [
    Restaurant("Pizza Hut", 17.752968015159524, 83.21847975223947),
    Restaurant("Sri Sairam Parlour", 17.726507383300792, 83.30299929960037),
  ];

  Future<void> checkDistances() async {
    locationloading = true;
    notifyListeners();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    try {
      Position user = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        user.latitude,
        user.longitude,
      );

      Placemark place = placemarks.first;

      String locationInfo =
          "${place.name}, ${place.street}, ${place.locality}, "
          "${place.postalCode}, ${place.administrativeArea}, ${place.country}";

      String output = locationInfo;

      // for (var restaurant in restaurants) {
      //   double distance = _calculateDistance(
      //     user.latitude,
      //     user.longitude,
      //     restaurant.lat,
      //     restaurant.lon,
      //   );
      //   output +=
      //       "${restaurant.name}: ${distance.toStringAsFixed(2)} km away\n";
      // }

      result = output;
    } catch (e) {
      result = "Error getting location: $e";
    }
    locationloading = false;
    notifyListeners();
  }

  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const R = 6371; // Earth radius in km
    double dLat = _deg2rad(lat2 - lat1);
    double dLon = _deg2rad(lon2 - lon1);
    double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(lat1)) *
            cos(_deg2rad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _deg2rad(double deg) => deg * pi / 180;
}
