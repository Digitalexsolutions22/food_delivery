import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/apis.dart';
import 'package:food_delivery/features/home/models/currentordersmodel.dart';
import 'package:food_delivery/features/home/models/currentplanmodel.dart';
import 'package:food_delivery/features/home/models/fooditemsmodel.dart';
import 'package:food_delivery/features/home/models/location_model.dart';
import 'package:food_delivery/features/home/models/categoriesmodel.dart';
import 'package:food_delivery/features/home/models/mealplansmodel.dart';
import 'package:food_delivery/features/home/models/seemealmodel.dart';
import 'package:food_delivery/features/home/models/viewcartmodel.dart';
import 'package:food_delivery/functions/networkhelper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Homeprovider extends ChangeNotifier {
  bool isloading = false;
  bool isadding = false;

  List<FoodItem> _allItems = [];
  List<FoodItem> searchItemsList = [];
  List<Category> foodCatList = [];

  FoodFilter currentFilter = FoodFilter.all;
  String currentCategory = 'All';

  Future<void> getSearchItems() async {
    isloading = true;
    notifyListeners();

    final res = await GetApiHelper().getRequest(Apis.foodItems);

    if (res['status'] == 'success' && res['data'] is List) {
      _allItems =
          (res['data'] as List).map((item) => FoodItem.fromJson(item)).toList();
      searchItemsList = List.from(_allItems);
    } else {
      _allItems = [];
      searchItemsList = [];
    }

    isloading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    isloading = true;
    notifyListeners();

    final res = await GetApiHelper().getRequest(Apis.foodCategories);

    if (res['status'] == 'success' && res['data'] is List) {
      foodCatList =
          (res['data'] as List).map((item) => Category.fromJson(item)).toList();
    } else {
      foodCatList = [];
    }

    isloading = false;
    notifyListeners();
  }

  // 🔹 Fixed Combined Filter
  void filterByTypeAndCategory() {
    List<FoodItem> filteredList = _allItems;

    // Apply type filter
    if (currentFilter == FoodFilter.veg) {
      filteredList = filteredList.where((item) => item.isVeg).toList();
    } else if (currentFilter == FoodFilter.nonVeg) {
      filteredList = filteredList.where((item) => !item.isVeg).toList();
    }

    // Apply category filter - FIXED
    if (currentCategory != 'All') {
      // Find the category ID for the selected category name
      final selectedCategoryData = foodCatList.firstWhere(
        (category) => category.categoryName == currentCategory,
        orElse:
            () => Category(
              categoryId: '',
              categoryName: '',
              categoryDescription: '',
              imageUrl: '',
              createdAt: '',
            ),
      );

      if (selectedCategoryData.categoryId.isNotEmpty) {
        filteredList =
            filteredList
                .where(
                  (item) =>
                      item.categoryId.toString() ==
                      selectedCategoryData.categoryId,
                )
                .toList();
      }
    }

    searchItemsList = filteredList;
    notifyListeners();
  }

  void setFilter(FoodFilter filter) {
    currentFilter = filter;
    filterByTypeAndCategory();
  }

  void setCategory(String category) {
    currentCategory = category;
    filterByTypeAndCategory();
  }

  List<FoodItem> foodItemsList = [];
  Future<void> getFoodItems() async {
    isloading = true;
    final res = await GetApiHelper().getRequest(Apis.foodItems);
    if (res['status'] == 'success' && res['data'] is List) {
      foodItemsList =
          (res['data'] as List).map((item) => FoodItem.fromJson(item)).toList();
      notifyListeners();
    } else {
      foodItemsList = [];
    }
    isloading = false;
    notifyListeners();
  }

  List<Booking> activeBookings = [];
  List<Booking> bookingList = [];

  Future<void> getBookings() async {
    isloading = true;

    final res = await GetApiHelper().getRequest("${Apis.bookings}?user_id=1");

    if (res['status'] == 'success' && res['data'] is List) {
      bookingList =
          (res['data'] as List).map((item) => Booking.fromJson(item)).toList();

      // Filter bookings where endDate >= today
      DateTime today = DateTime.now();
      activeBookings =
          bookingList.where((b) {
            try {
              DateTime end = DateTime.parse(b.endDate);
              return end.isAfter(today) || end.isAtSameMomentAs(today);
            } catch (e) {
              return false;
            }
          }).toList();

      notifyListeners();
    } else {
      bookingList = [];
      activeBookings = [];
    }

    isloading = false;
    notifyListeners();
  }

  List<MealPlan> planslist = [];

  Future<void> getPlanItems() async {
    isloading = true;
    final res = await GetApiHelper().getRequest(Apis.planItems);

    if (res['status'] == 'success' && res['data'] is List) {
      planslist =
          (res['data'] as List).map((item) => MealPlan.fromJson(item)).toList();
      log(planslist.length.toString());
    } else {
      planslist = [];
    }

    isloading = false;
    notifyListeners();
  }

  // show meal list
  PlanWithItems? planWithItems;

  Future<void> getPlanMeal(String planId) async {
    isloading = true;
    final res = await GetApiHelper().getRequest(
      "${Apis.listItems}?plan_id=$planId",
    );

    if (res['status'] == 'success' && res['plan'] != null) {
      planWithItems = PlanWithItems.fromJson(res);
      log(planWithItems!.items.length.toString()); // Example: 3 items
    } else {
      planWithItems = null;
    }

    isloading = false;
    notifyListeners();
  }

  // get schedule
  List<Schedule> scheduleList = [];

  Future<void> getSchedule(String bookingId) async {
    isloading = true;

    final res = await GetApiHelper().getRequest(
      "${Apis.getschedule}?booking_id=$bookingId",
    );

    if (res['status'] == 'success' && res['data'] is List) {
      scheduleList =
          (res['data'] as List).map((item) => Schedule.fromJson(item)).toList();
      log(scheduleList.length.toString()); // Example: 6 items
    } else {
      scheduleList = [];
    }

    isloading = false;
    notifyListeners();
  }

  // get cart
  List<CartItem> cartList = [];

  Future<void> getCart(String userId) async {
    isloading = true;

    final res = await GetApiHelper().getRequest(
      "${Apis.viewCart}?user_id=$userId",
    );

    if (res['status'] == 'success' && res['cart'] is List) {
      cartList =
          (res['cart'] as List).map((item) => CartItem.fromJson(item)).toList();
      log(cartList.length.toString()); // Example: 2 items
    } else {
      cartList = [];
    }

    isloading = false;
    notifyListeners();
  }

  //remove cart
  Future<void> removeFromCart(BuildContext context, String cartId) async {
    isloading = true;

    final res = await PostApiHelper().postRequest(Apis.removeCart, {
      "cart_id": cartId,
    });

    if (res?['status'] == 'success') {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?['message'] ?? "Item removed successfully")),
      );

      // Optionally refresh cart list
      await getCart("1"); // pass userId here
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?['message'] ?? "Failed to remove item")),
      );
    }

    isloading = false;
    notifyListeners();
  }

  //add to cart
  Future<void> addToCart(
    BuildContext context,
    String foodId,
    String quantity,
  ) async {
    isadding = true;
    notifyListeners();

    final res = await PostApiHelper().postRequest(Apis.addToCart, {
      "user_id": "1",
      "food_id": foodId,
      "quantity": quantity,
    });

    if (res?['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?['message'] ?? "Item added to cart")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?['message'] ?? "Failed to add item")),
      );
    }

    isadding = false;
    notifyListeners();
  }

  // update cart
  Future<void> updateCart(
    BuildContext context,
    String cartId,
    String quantity,
  ) async {
    isloading = true;

    final res = await PostApiHelper().postRequest(Apis.updateCart, {
      "cart_id": cartId,
      "quantity": quantity,
    });

    if (res?['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?['message'] ?? "Cart updated successfully")),
      );

      // Refresh cart list
      await getCart("1"); // replace "1" with userId
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?['message'] ?? "Failed to update cart")),
      );
    }

    isloading = false;
    notifyListeners();
  }

  int selectedCategoryIndex = 0;

  void filterSearchResults(String query) {
    List<FoodItem> baseList = _allItems;

    // Apply search query
    if (query.isNotEmpty) {
      baseList =
          baseList
              .where(
                (item) =>
                    item.foodName.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }

    searchItemsList = baseList;
    notifyListeners();
  }

  void filterByType() {
    if (currentFilter == FoodFilter.veg) {
      searchItemsList = _allItems.where((item) => item.isVeg).toList();
    } else if (currentFilter == FoodFilter.nonVeg) {
      searchItemsList = _allItems.where((item) => !item.isVeg).toList();
    } else {
      searchItemsList = List.from(_allItems);
    }
    notifyListeners();
  }

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

  // double _calculateDistance(
  //   double lat1,
  //   double lon1,
  //   double lat2,
  //   double lon2,
  // ) {
  //   const R = 6371; // Earth radius in km
  //   double dLat = _deg2rad(lat2 - lat1);
  //   double dLon = _deg2rad(lon2 - lon1);
  //   double a =
  //       sin(dLat / 2) * sin(dLat / 2) +
  //       cos(_deg2rad(lat1)) *
  //           cos(_deg2rad(lat2)) *
  //           sin(dLon / 2) *
  //           sin(dLon / 2);
  //   double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  //   return R * c;
  // }

  // double _deg2rad(double deg) => deg * pi / 180;
}
