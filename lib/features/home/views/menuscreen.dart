import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/appbar.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedCategoryIndex = 0;
  bool isVeg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomScrollView(
            slivers: [
              // Title
              Menuheader(title: "Our Menu"),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Veg/Non-Veg Toggle
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => isVeg = true),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isVeg ? Colors.green[50] : Colors.transparent,
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppImages.vegicon, height: 15),
                                SizedBox(width: 8),
                                Text(
                                  'Veg',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => setState(() => isVeg = false),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  !isVeg ? Colors.red[50] : Colors.transparent,
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AppImages.nonvegicon, height: 15),
                                SizedBox(width: 8),
                                Text(
                                  'Non-Veg',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // Category Tabs
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryTab('All', Icons.restaurant, 0),
                          SizedBox(width: 8),
                          _buildCategoryTab('Breakfast', Icons.local_cafe, 1),
                          SizedBox(width: 8),
                          _buildCategoryTab('Lunch', Icons.wb_sunny, 2),
                          SizedBox(width: 8),
                          _buildCategoryTab('Dinner', Icons.nights_stay, 3),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),

              // Menu Items List
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildMenuItem(),
                  childCount: 10, // you can change count
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title, IconData icon, int index) {
    bool isSelected = selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedCategoryIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.orange : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: 2, left: 2),
      padding: EdgeInsets.only(right: 16, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            child: SizedBox(
              width: 136,
              child: Container(
                color: Colors.grey[200],
                child: Image.asset(AppImages.menuimage, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 16),

          // Food Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Aloo Paratha with Curd',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        '  ₹85',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Stuffed potato flatbread with fresh yogurt & pickle',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.blue),
                      SizedBox(width: 4),
                      Text('25-30 min', style: TextStyle(fontSize: 12)),
                      SizedBox(width: 16),
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('4.8', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, size: 18),
                    label: Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
