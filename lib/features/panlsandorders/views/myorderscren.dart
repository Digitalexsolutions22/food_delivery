import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/enms.dart';
import 'package:food_delivery/constants/images1.dart';
import 'package:food_delivery/customwidgets/text/appbar.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/customwidgets/text/continerdecoration.dart';

class MyorderScreen extends StatefulWidget {
  const MyorderScreen({super.key});

  @override
  State<MyorderScreen> createState() => _MyorderScreenState();
}

Myorders screentype = Myorders.currentorder;

class _MyorderScreenState extends State<MyorderScreen> {
  bool isSelected = false;

  void _handleTap(Myorders screnn) {
    setState(() {
      screentype = screnn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          // AppBar with shrinking behavior
          CollapsibleHeader(
            title: "My Orders",
            subtitle: "Choose a plan that suits your lifestyle",
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _handleTap(Myorders.currentorder);
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.orange,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                // Background fill animation
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    width:
                                        screentype == Myorders.currentorder
                                            ? 200
                                            : 0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),

                                // Centered text above fill
                                Center(
                                  child: MainBody(
                                    title: "Current Orders",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontcolor:
                                        screentype == Myorders.currentorder
                                            ? AppColors.white
                                            : AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _handleTap(Myorders.orderhisstory);
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.orange,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                // Background fill animation
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    width:
                                        screentype == Myorders.orderhisstory
                                            ? 200
                                            : 0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),

                                // Centered text above fill
                                Center(
                                  child: MainBody(
                                    title: "Order History",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontcolor:
                                        screentype == Myorders.orderhisstory
                                            ? AppColors.white
                                            : AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (screentype == Myorders.currentorder)
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),

                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: defaultBoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        MainBody(
                                          title: "Order ",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontcolor: AppColors.black,
                                        ),
                                        MainBody(
                                          title: " #TFB001234",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontcolor: AppColors.gray,
                                        ),
                                      ],
                                    ),

                                    StatusTag(
                                      title: 'Preparing',
                                      backgroundColor: AppColors.softYellow,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                MainBody(
                                  title: "Homestyle Dal Chawal",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontcolor: AppColors.black,
                                ),
                                SizedBox(height: 10),
                                MainBody(
                                  title: "Quantity: 1 • ₹120",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontcolor: AppColors.gray,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.grayLight,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset(
                                              AppImages1.clock,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          MainBody(
                                            title:
                                                "Estimated delivery: 15-20 min",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            fontcolor: AppColors.gray,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: Image.asset(
                                              AppImages1.location,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          MainBody(
                                            title: "HSR Layout, Sector 1",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            fontcolor: AppColors.gray,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.orange),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: MainBody(
                                      title: "Call Now",
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      fontcolor: AppColors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  if (screentype == Myorders.orderhisstory)
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: defaultBoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        MainBody(
                                          title: "Order ",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontcolor: AppColors.black,
                                        ),
                                        MainBody(
                                          title: " #TFB001234",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontcolor: AppColors.gray,
                                        ),
                                      ],
                                    ),

                                    StatusTag(
                                      title: 'Preparing',
                                      backgroundColor: AppColors.freshGreen,
                                      fontcolor: AppColors.white,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                MainBody(
                                  title: "Homestyle Dal Chawal",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontcolor: AppColors.black,
                                ),
                                SizedBox(height: 10),
                                MainBody(
                                  title: "Quantity: 1 • ₹120",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontcolor: AppColors.gray,
                                ),
                                SizedBox(height: 10),
                                MainBody(
                                  title: "2 Hours Ago",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontcolor: AppColors.gray,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    StatusTag(
                                      title: 'Reorder',
                                      backgroundColor: AppColors.softYellow1,
                                      fontcolor: AppColors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
