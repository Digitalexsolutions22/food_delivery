class PlanWithItems {
  final String planId;
  final String planName;
  final String description;
  final String durationType;
  final String price;
  final String offerPrice;
  final String status;
  final String createdAt;
  final List<PlanMealItem> items;

  PlanWithItems({
    required this.planId,
    required this.planName,
    required this.description,
    required this.durationType,
    required this.price,
    required this.offerPrice,
    required this.status,
    required this.createdAt,
    required this.items,
  });

  factory PlanWithItems.fromJson(Map<String, dynamic> json) {
    return PlanWithItems(
      planId: json['plan']['plan_id'],
      planName: json['plan']['plan_name'],
      description: json['plan']['description'],
      durationType: json['plan']['duration_type'],
      price: json['plan']['price'],
      offerPrice: json['plan']['offer_price'],
      status: json['plan']['status'],
      createdAt: json['plan']['created_at'],
      items:
          (json['items'] as List)
              .map((item) => PlanMealItem.fromJson(item))
              .toList(),
    );
  }
}

class PlanMealItem {
  final String itemId;
  final String planId;
  final String foodId;
  final String mealTime;
  final String foodName;
  final String foodType;
  final String imageUrl;

  PlanMealItem({
    required this.itemId,
    required this.planId,
    required this.foodId,
    required this.mealTime,
    required this.foodName,
    required this.foodType,
    required this.imageUrl,
  });

  factory PlanMealItem.fromJson(Map<String, dynamic> json) {
    return PlanMealItem(
      itemId: json['item_id'],
      planId: json['plan_id'],
      foodId: json['food_id'],
      mealTime: json['meal_time'],
      foodName: json['food_name'],
      foodType: json['food_type'],
      imageUrl: json['image_url'],
    );
  }
}
