import 'package:flutter/material.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/features/home/models/categoriesmodel.dart';

class CategoryFilter extends StatefulWidget {
  final Function(String) onCategorySelected;
  final List<Category> categories;

  const CategoryFilter({
    super.key,
    required this.onCategorySelected,
    required this.categories,
  });

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final allCategories = [
      Category(
        categoryId: '0',
        categoryName: 'All',
        categoryDescription: '',
        imageUrl: AppImages.menucategories[0], // local asset for "All"
        createdAt: '',
      ),
      ...widget.categories,
    ];

    return Container(
      height: 123,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          final category = allCategories[index];
          final isSelected = selectedCategory == category.categoryName;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category.categoryName;
              });
              widget.onCategorySelected(category.categoryName);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                isSelected ? Colors.orange : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: ClipOval(child: _buildCategoryImage(category)),
                      ),
                      if (isSelected)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category.categoryName,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.orange : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryImage(Category category) {
    // If it's the "All" category, use local asset
    if (category.categoryId == '0') {
      return Image.asset(category.imageUrl, fit: BoxFit.cover);
    }

    // Otherwise load from API (handle missing images)
    return Image.network(
      category.imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: Icon(
            _getCategoryIcon(category.categoryName),
            color: Colors.grey[600],
            size: 30,
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'all':
        return Icons.restaurant;
      case 'biryani':
        return Icons.rice_bowl;
      case 'tiffins':
        return Icons.lunch_dining;
      case 'meals':
        return Icons.dinner_dining;
      default:
        return Icons.fastfood;
    }
  }
}
