import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(color: Color(0xFFFF6B00)),
                ),

                // Main content
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              Row(
                                children: [
                                  Text(
                                    'Hello Geetto ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text('👋', style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              Text(
                                'Ready to eat good today?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white.withOpacity(0.8),
                                    size: 14,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    provider.result,
                                    // 'HSR Layout, Bangalore • 10km radius',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Location button
                          Positioned(
                            right: 0,
                            top: 30,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child:
                                  provider.locationloading
                                      ? CircularProgressIndicator(
                                        padding: EdgeInsets.all(16),
                                        strokeWidth: 2,
                                        color: AppColors.creamWhite,
                                      )
                                      : IconButton(
                                        onPressed: () {
                                          provider.checkDistances();
                                        },
                                        icon: Icon(Icons.location_on),
                                        color: Colors.white.withOpacity(0.8),
                                        iconSize: 24,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Food card
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 346,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Image without any padding or spacing
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    AppImages.homeimage,
                                    height: 165,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rajma Chawal + Roti',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        'Creamy kidney bean curry with basmati rice & fresh roti',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600],
                                          height: 1.4,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.blue.withOpacity(
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 16,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  '25-30 min',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.orange.withOpacity(
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.orange,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  '4.8',
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '₹180',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[400],
                                                  decoration:
                                                      TextDecoration
                                                          .lineThrough,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '₹149',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.orange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 0,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 24,
                                                  vertical: 6,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
                                                    color: AppColors.cream,
                                                    size: 18,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    'Order Now',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentContext?.go('/plans');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainBody(
                                  title: "Meal Packages",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                Row(
                                  children: [
                                    MainBody(
                                      title: "View All ",
                                      fontSize: 14,
                                      fontcolor: AppColors.orange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.orange,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 154,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Container(
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color:
                                          index % 2 == 0
                                              ? AppColors.blueTransparent
                                              : AppColors.yellowTransparent,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 18),
                                        MainBody(
                                          title: "Daily",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 8),
                                        MainBody(
                                          title: "₹149",
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 8),
                                        MainBody(
                                          title: "1 meal/day",
                                          fontSize: 10,
                                          fontcolor: AppColors.gray,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 14),
                                        Container(
                                          width: 103,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                          ),
                                          child: Center(
                                            child: MainBody(
                                              title: "Flexible",
                                              fontcolor:
                                                  index % 2 == 0
                                                      ? AppColors.blueLight
                                                      : AppColors.yellow,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          MainBody(
                            title: "Quick Actions",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 150,
                            child: GridView.builder(
                              itemCount: 4,
                              padding: EdgeInsets.all(0),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 64,
                                  ),

                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  width: 157,
                                  height: 62,
                                  decoration: BoxDecoration(
                                    color:
                                        index > 1
                                            ? AppColors.blueTransparent
                                            : AppColors.yellowTransparent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.white,
                                        ),
                                        child: Image.asset(
                                          AppImages.actions[index],
                                          scale: 1.8,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 14),
                                          MainBody(
                                            title: AppImages.actionstext[index],
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(height: 2),
                                          MainBody(
                                            title:
                                                AppImages.actionssubtext[index],
                                            fontSize: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentContext?.go('/menu');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainBody(
                                  title: "Today’s Specials",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                Row(
                                  children: [
                                    MainBody(
                                      title: "View All ",
                                      fontSize: 14,
                                      fontcolor: AppColors.orange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.orange,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(
                                top: 12,
                                left: 2,
                                bottom: 12,
                                right: 12,
                              ),

                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 12, left: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 3,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                        child: Image.asset(
                                          AppImages.homeimage,
                                          height: 70,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Chicken Biryani',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black87,
                                                    ),
                                                    maxLines: 2,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '₹149',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          Text(
                                                            '4.8',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            SizedBox(
                                              height: 32,
                                              width: 136,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.orange,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  elevation: 0,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Add to cart',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
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
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
