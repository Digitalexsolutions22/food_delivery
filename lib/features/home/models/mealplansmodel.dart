class MealPlan {
  final String planId;
  final String planName;
  final String description;
  final String durationType;
  final String price;
  final String offerPrice;
  final String status;
  final String createdAt;

  MealPlan({
    required this.planId,
    required this.planName,
    required this.description,
    required this.durationType,
    required this.price,
    required this.offerPrice,
    required this.status,
    required this.createdAt,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      planId: json['plan_id'] ?? '',
      planName: json['plan_name'] ?? '',
      description: json['description'] ?? '',
      durationType: json['duration_type'] ?? '',
      price: json['price'] ?? '',
      offerPrice: json['offer_price'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plan_id': planId,
      'plan_name': planName,
      'description': description,
      'duration_type': durationType,
      'price': price,
      'offer_price': offerPrice,
      'status': status,
      'created_at': createdAt,
    };
  }
}
