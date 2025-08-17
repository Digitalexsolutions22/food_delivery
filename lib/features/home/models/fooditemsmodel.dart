class FoodItem {
  final int foodId;
  final int categoryId;
  final int mealTimeId;
  final String foodName;
  final String foodDescription;
  final String foodType; // "Veg" or "Non-Veg"
  final String actualPrice;
  final String offerPrice;
  final String imageUrl;
  final int isAvailable;
  final String createdAt;
  final String updatedAt;

  FoodItem({
    required this.foodId,
    required this.categoryId,
    required this.mealTimeId,
    required this.foodName,
    required this.foodDescription,
    required this.foodType,
    required this.actualPrice,
    required this.offerPrice,
    required this.imageUrl,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Computed property for easier filtering
  bool get isVeg => foodType.toLowerCase() == 'veg';

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      foodId: json['food_id'],
      categoryId: json['category_id'],
      mealTimeId: json['meal_time_id'],
      foodName: json['food_name'],
      foodDescription: json['food_description'],
      foodType: json['food_type'],
      actualPrice: json['actual_price'],
      offerPrice: json['offer_price'],
      imageUrl: json['image_url'],
      isAvailable: json['is_available'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

enum FoodFilter { all, veg, nonVeg }
