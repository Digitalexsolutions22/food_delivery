import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/customwidgets/loading_screens.dart/loading_menu.dart';
import 'package:food_delivery/customwidgets/menucategories.dart';
import 'package:food_delivery/customwidgets/text/appbar.dart';
import 'package:food_delivery/features/home/models/fooditemsmodel.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';

import 'package:food_delivery/features/home/views/menuitem.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<Homeprovider>(context, listen: false);
    provider.getSearchItems();
    provider.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:
              provider.isloading
                  ? LoadingMenu()
                  : SafeArea(
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
                                    // All button
                                    GestureDetector(
                                      onTap: () {
                                        provider.setFilter(FoodFilter.all);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              provider.currentFilter ==
                                                      FoodFilter.all
                                                  ? Colors.blue[50]
                                                  : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          'All',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),

                                    // Veg button
                                    GestureDetector(
                                      onTap: () {
                                        provider.setFilter(FoodFilter.veg);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              provider.currentFilter ==
                                                      FoodFilter.veg
                                                  ? Colors.green[50]
                                                  : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AppImages.vegicon,
                                              height: 15,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Veg',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),

                                    // Non-Veg button
                                    GestureDetector(
                                      onTap: () {
                                        provider.setFilter(FoodFilter.nonVeg);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              provider.currentFilter ==
                                                      FoodFilter.nonVeg
                                                  ? Colors.red[50]
                                                  : Colors.transparent,
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AppImages.nonvegicon,
                                              height: 15,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Non-Veg',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),

                                CategoryFilter(
                                  onCategorySelected: (category) {
                                    provider.setCategory(category);
                                  },
                                  categories: provider.foodCatList,
                                ),
                              ],
                            ),
                          ),

                          // Menu Items List
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => _buildMenuItem(
                                provider.searchItemsList[index].foodName,
                                provider.searchItemsList[index].foodDescription,
                                provider.searchItemsList[index].offerPrice,
                                provider.searchItemsList[index].foodId
                                    .toString(),
                              ),
                              childCount: provider.searchItemsList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    String name,
    String details,
    String price,
    String foodid,
  ) {
    final provider = Provider.of<Homeprovider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        menuitem(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16, top: 2, left: 2),
        padding: EdgeInsets.only(right: 16, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withAlpha(26),

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
                            name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          Appstring.ruppee + price,
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
                      details,
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
                      onPressed: () {
                        provider.addToCart(context, foodid, "1");
                      },
                      icon:
                          provider.isadding
                              ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white70,
                                ),
                              )
                              : Icon(Icons.add, size: 18),
                      label:
                          provider.isadding
                              ? Text('Adding')
                              : Text('Add to Cart'),
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
      ),
    );
  }
}
