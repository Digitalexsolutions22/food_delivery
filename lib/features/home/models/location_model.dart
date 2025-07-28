import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Restaurant {
  final String name;
  final double lat;
  final double lon;

  Restaurant(this.name, this.lat, this.lon);
}

class LocationChecker extends StatefulWidget {
  const LocationChecker({super.key});

  @override
  State<LocationChecker> createState() => _LocationCheckerState();
}

class _LocationCheckerState extends State<LocationChecker> {
  String result = "Press button to check distances";

  final List<Restaurant> restaurants = [
    Restaurant("Pizza Hut", 17.752968015159524, 83.21847975223947),
    Restaurant("Hotel Prabha", 17.745851243664823, 83.23534844983605),
    Restaurant("Sri Sairam Parlour", 17.726507383300792, 83.30299929960037),
  ];

  Future<void> checkDistances() async {
    try {
      LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );
      Position user = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      String output =
          "Your Location:\n"
          "Lat: ${user.latitude}, Lon: ${user.longitude}\n\n";

      for (var restaurant in restaurants) {
        double distance = _calculateDistance(
          user.latitude,
          user.longitude,
          restaurant.lat,
          restaurant.lon,
        );

        output +=
            "${restaurant.name}: ${distance.toStringAsFixed(2)} km away\n";
      }

      setState(() => result = output);
    } catch (e) {
      setState(() => result = "Error getting location: $e");
    }
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

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Nearby Restaurants")),
    body: Padding(padding: EdgeInsets.all(16), child: Text(result)),
    floatingActionButton: FloatingActionButton(
      onPressed: checkDistances,
      child: Icon(Icons.location_on),
    ),
  );
}
