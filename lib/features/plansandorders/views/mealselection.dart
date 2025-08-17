
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/customwidgets/loading_screens.dart/loading_screen.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MealSelectionScreen extends StatefulWidget {
  const MealSelectionScreen({super.key});

  @override
  _MealSelectionScreenState createState() => _MealSelectionScreenState();
}

class _MealSelectionScreenState extends State<MealSelectionScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<Homeprovider>(context, listen: false);
    provider.getPlanMeal("1");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.orange,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.headset_mic, color: Colors.white, size: 22),
                onPressed: () {},
              ),
            ],
          ),
          body:
              provider.isloading
                  ? LoadingScreen()
                  : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                provider.planWithItems?.items.length ?? 0,

                            itemBuilder: (context, index) {
                              final meal = provider.planWithItems?.items[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (index == 0) SizedBox(height: 22),

                                  // Meal Section Title
                                  Text(
                                    meal!.mealTime,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12),

                                  // Meal Card
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MealCard(
                                          title: meal.foodName,
                                          foodType: meal.foodType,
                                          imageAsset: meal.imageUrl,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height:
                                        (provider.planWithItems?.items !=
                                                    null &&
                                                index ==
                                                    provider
                                                            .planWithItems!
                                                            .items
                                                            .length -
                                                        1)
                                            ? 80
                                            : 24,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),

                      // Bottom Section
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle subscription
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orange,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Subscribe Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}

class MealCard extends StatelessWidget {
  final String title;
  final String foodType;
  final String imageAsset;

  const MealCard({
    super.key,
    required this.title,
    required this.foodType,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    // Determine food type colors
    Color foodTypeColor =
        foodType.toLowerCase() == 'veg' ? Colors.green : Colors.red;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                // Placeholder for image
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageAsset,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(
                          Icons.fastfood,
                          size: 40,
                          color: Colors.grey,
                        ),
                  ),
                ),
                // Food type indicator
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: foodTypeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      foodType,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content Section
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: MainBody(
                    title: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontcolor: Colors.black,
                    textAlign: TextAlign.start,
                    maxlines: 2,
                    applymaxlines: true,
                  ),
                ),
                SizedBox(height: 4),
                // Food type badge at bottom
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: foodTypeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: foodTypeColor.withOpacity(0.3)),
                  ),
                  child: Text(
                    foodType,
                    style: TextStyle(
                      color: foodTypeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
