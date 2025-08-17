import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/features/plansandorders/views/mealselection.dart';

class PlanDetailsBottomSheet extends StatelessWidget {
  final String planDuration;
  final String planDays;
  final String planType;
  final String mealTypes;
  final String startDate;
  final String currentPrice;
  final String originalPrice;
  final List<String> availableDays;
  final VoidCallback? onSelectMeals;

  const PlanDetailsBottomSheet({
    super.key,
    this.planDuration = '2 Weeks',
    this.planDays = '10',
    this.planType = 'Weight loss',
    this.mealTypes = 'Breakfast, lunch, dinner',
    this.startDate = 'Starts from 05 Aug',
    this.currentPrice = ' 929.99',
    this.originalPrice = ' 1059',
    this.availableDays = const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu'],
    this.onSelectMeals,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 24), // For symmetry
                    Text(
                      'Plan Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 24),
                    ),
                  ],
                ),
              ),
              // Scrollable content
              Divider(),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Plan duration and details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                planDays,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Days',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  planDuration,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      planType,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(
                                  mealTypes,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26),

                      // Start date section
                      Text(
                        'When to start your subscription?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                startDate,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),

                      // Available days
                      Text(
                        'Available days for delivery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _buildDayChips(),
                      ),
                      SizedBox(height: 26),

                      // Price section
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Plan price',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '*All prices including GST',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      currentPrice,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      originalPrice,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[500],
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      // Select meals button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealSelectionScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Select Meals',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildDayChips() {
    const allDays = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

    return allDays.map((day) {
      bool isAvailable = availableDays.contains(day);
      return Container(
        width: 45,
        height: 32,
        decoration: BoxDecoration(
          color: isAvailable ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isAvailable ? Colors.white : Colors.grey[500],
            ),
          ),
        ),
      );
    }).toList();
  }

  // Static method to show the bottom sheet
  static void show(
    BuildContext context, {
    String planDuration = '2 Weeks',
    String planDays = '10',
    String planType = 'Weekly Plan',
    String mealTypes = 'Breakfast, lunch, dinner',
    String calorieRange = 'Calories: 1100 - 1500',
    String startDate = 'Starts from 05 Aug',
    String currentPrice = '929.99',
    String originalPrice = '1059',
    List<String> availableDays = const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu'],
    VoidCallback? onSelectMeals,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => PlanDetailsBottomSheet(
            planDuration: planDuration,
            planDays: planDays,
            planType: planType,
            mealTypes: mealTypes,

            startDate: startDate,
            currentPrice: currentPrice,
            originalPrice: originalPrice,
            availableDays: availableDays,
            onSelectMeals: onSelectMeals,
          ),
    );
  }
}
