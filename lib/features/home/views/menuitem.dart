import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

Future<void> menuitem(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    backgroundColor: AppColors.white,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.66,
            minChildSize: 0.6,
            maxChildSize: 0.90,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Food Image with close button
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Image.asset(
                              AppImages.menuimage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // High Protein Badge
                        // Positioned(
                        //   left: 16,
                        //   bottom: 16,
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(
                        //       horizontal: 8,
                        //       vertical: 4,
                        //     ),
                        //     decoration: BoxDecoration(
                        //       color: Colors.pink[100],
                        //       borderRadius: BorderRadius.circular(12),
                        //       border: Border.all(color: Colors.pink[300]!),
                        //     ),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Icon(
                        //           Icons.fitness_center,
                        //           size: 16,
                        //           color: Colors.black,
                        //         ),
                        //         SizedBox(width: 4),
                        //         Text(
                        //           "HIGH\nPROTEIN",
                        //           style: TextStyle(
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.black,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // Close button
                        Positioned(
                          right: 16,
                          top: 16,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Delivery time and rating
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.red[200]!),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 12,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "25mins",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.bolt,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12),
                              Icon(Icons.star, color: Colors.green, size: 16),
                              SizedBox(width: 2),
                              Text(
                                "4.6 (59)",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // Title and Add button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainBody(
                                      title:
                                          "Double Omelette with Masala Bread",
                                      fontSize: 18,
                                      maxlines: 3,
                                      applymaxlines: true,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "₹179",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            "₹149",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 34,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.6,
                                  ), // Gray border
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    // Shadow
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(200),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(1, 6), // vertical shadow
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // Description
                          Text(
                            "A protein-rich omelette with masala kulcha bread & butter on the side. (Energy: 669KCal, Carbohydrates: 58gm, Proteins: 22gm, Fats: 38gm, Sodium: 546mg)",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.4,
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
        },
      );
    },
  );
}
