class Category {
  final String categoryId;
  final String categoryName;
  final String categoryDescription;
  final String imageUrl;
  final String createdAt;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'] ?? '',
      categoryName: json['category_name'] ?? '',
      categoryDescription: json['category_description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'category_description': categoryDescription,
      'image_url': imageUrl,
      'created_at': createdAt,
    };
  }
}

class CategoryResponse {
  final String status;
  final List<Category> data;

  CategoryResponse({required this.status, required this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json['status'] ?? '',
      data:
          (json['data'] as List<dynamic>)
              .map((item) => Category.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
