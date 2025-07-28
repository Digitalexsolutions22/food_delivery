import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/animations.dart/hearbeetanimation.dart';
import 'package:food_delivery/customwidgets/text/appbar.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Infinite rotating animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          // AppBar with shrinking behavior
          CollapsibleHeader(
            title: "Subscriptions",
            subtitle: "Choose a plan that suits your lifestyle",
          ),
          // Body content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // active plan
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.lightGrey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainBody(
                                title: "Current Plan",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              HeartbeatButton(),
                            ],
                          ),
                          SizedBox(height: 20),
                          // plane details
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  MainBody(
                                    title: "Weekly Plan",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontcolor: AppColors.orange,
                                  ),
                                  SizedBox(height: 5),
                                  MainBody(
                                    title: "Plan Type",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontcolor: AppColors.gray,
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  MainBody(
                                    title: "4",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontcolor: AppColors.orange,
                                  ),
                                  SizedBox(height: 5),
                                  MainBody(
                                    title: "Days Left",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontcolor: AppColors.gray,
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  MainBody(
                                    title: "4",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontcolor: AppColors.orange,
                                  ),
                                  SizedBox(height: 5),
                                  MainBody(
                                    title: "Meals Left",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontcolor: AppColors.gray,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(thickness: 1, color: AppColors.lightGrey),
                          Row(
                            children: [
                              Image.asset(AppImages.clock, scale: 3),
                              SizedBox(width: 10),
                              MainBody(
                                title: "Next delivery: Tomorrow, 12:30 PM",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontcolor: AppColors.gray,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MainBody(
                    title: "Choose Your Plan",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.lightGrey,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MainBody(
                                            title: "Daily Plan",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          Column(
                                            children: [
                                              MainBody(
                                                title: "₹150",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontcolor: AppColors.orange,
                                              ),

                                              MainBody(
                                                title: "per meal",
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      MainBody(
                                        title: "Order as you go",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontcolor: AppColors.gray,
                                      ),
                                      SizedBox(height: 10),
                                      ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 5,
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  AppImages.rightcheck,
                                                  scale: 3,
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: MainBody(
                                                    title: "No commitment",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: AppColors.orange,
                                        ),
                                        child: Center(
                                          child: MainBody(
                                            title: "Subscribe",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontcolor: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Positioned(
                              left: 118,
                              top: 1,
                              child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 1,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(555),
                                      color: AppColors.white,
                                    ),
                                    child: const MainBody(
                                      title: " Recommended",
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      fontcolor: AppColors.white,
                                    ),
                                  );
                                },
                              ),
                            ),

                            Positioned(
                              left: 120,
                              top: 1,
                              child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return CustomPaint(
                                    painter: ConicGlowBorderPainter(
                                      rotation: _controller.value,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 1,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          555,
                                        ),
                                        color: AppColors.white,
                                      ),
                                      child: const MainBody(
                                        title: "Recommended",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        fontcolor: AppColors.orange,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  MainBody(title: "Why Subscribe?", fontSize: 16),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.yellowTransparent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.restaurant_menu,
                                color: AppColors.orange,
                                size: 20,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Fresh Daily',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Prepared fresh every day',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.yellowTransparent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: AppColors.orange,
                                size: 20,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Flexible',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Skip or pause anytime',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
