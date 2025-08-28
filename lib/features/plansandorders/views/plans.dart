import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/loading_screens.dart/loading_screen.dart';
import 'package:food_delivery/customwidgets/text/animations.dart/hearbeetanimation.dart';
import 'package:food_delivery/customwidgets/text/appbar.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:food_delivery/features/plansandorders/views/plandetails.dart';
import 'package:food_delivery/functions/uxhelper.dart';
import 'package:provider/provider.dart';

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
    // final provider = Provider.of<Homeprovider>(context, listen: false);
    // provider.getPlanItems();
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
    return Consumer<Homeprovider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body:
              provider.isloading
                  ? LoadingScreen()
                  : CustomScrollView(
                    slivers: [
                      // AppBar with shrinking behavior
                      CollapsibleHeader(
                        title: "Subscriptions",
                        subtitle: "Choose a plan that suits your lifestyle",
                      ),
                      // Body content
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              // active plan
                              provider.activeBookings.isEmpty
                                  ? Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.lightGrey,
                                      ),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'No Active Plan',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                  : SizedBox(
                                    height: 166,
                                    child: PageView.builder(
                                      itemCount: provider.activeBookings.length,
                                      itemBuilder: (context, index) {
                                        var data =
                                            provider.activeBookings[index];
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ), // Add margin between cards
                                          padding: const EdgeInsets.all(
                                            16,
                                          ), // Increased padding
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: AppColors.lightGrey,
                                            ),
                                            color:
                                                Colors
                                                    .white, // Add background color
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.05,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              // Header Row
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: MainBody(
                                                      title: "Current Plans",
                                                      fontSize: 16,
                                                      fontcolor:
                                                          AppColors.deepGreen,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  HeartbeatButton(),
                                                ],
                                              ),
                                              const SizedBox(height: 16),

                                              // Plan Details Row
                                              Row(
                                                children: [
                                                  // Plan Name Column
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        MainBody(
                                                          title: data.planName,
                                                          fontSize: 15,
                                                          maxlines: 2,
                                                          applymaxlines: true,
                                                          textAlign:
                                                              TextAlign.left,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontcolor:
                                                              Colors.black87,
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        MainBody(
                                                          title: "Plan Type",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontcolor:
                                                              AppColors.gray,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  const SizedBox(width: 16),

                                                  // Days Left Column
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        MainBody(
                                                          title:
                                                              daysLeftMessage(
                                                                data.endDate
                                                                    .toString(),
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontcolor:
                                                              Colors.black87,
                                                        ),
                                                        // const SizedBox(height: 4),
                                                        // MainBody(
                                                        //   title: "Days Left",
                                                        //   fontSize: 12,
                                                        //   fontWeight:
                                                        //       FontWeight.w500,
                                                        //   fontcolor: AppColors.gray,
                                                        // ),
                                                      ],
                                                    ),
                                                  ),

                                                  // Meals Left Column
                                                  // Expanded(
                                                  //   flex: 2,
                                                  //   child: Column(
                                                  //     crossAxisAlignment:
                                                  //         CrossAxisAlignment.center,
                                                  //     children: [
                                                  //       MainBody(
                                                  //         title: "10",
                                                  //         fontSize: 15,
                                                  //         fontWeight:
                                                  //             FontWeight.bold,
                                                  //         fontcolor: Colors.black87,
                                                  //       ),
                                                  //       const SizedBox(height: 4),
                                                  //       MainBody(
                                                  //         title: "Meals Left",
                                                  //         fontSize: 12,
                                                  //         fontWeight:
                                                  //             FontWeight.w500,
                                                  //         fontcolor: AppColors.gray,
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ],
                                              ),

                                              const SizedBox(height: 16),

                                              // Divider
                                              Divider(
                                                thickness: 1,
                                                color: AppColors.lightGrey,
                                                height: 1,
                                              ),

                                              const SizedBox(height: 12),

                                              // Delivery Info Row
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AppImages.clock,
                                                    scale: 4,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: MainBody(
                                                      title:
                                                          "Next delivery: Tomorrow, 12:30 PM",
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontcolor: AppColors.gray,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                              SizedBox(height: 30),
                              MainBody(
                                title: "Choose Your Plan",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.planslist.length,
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: AppColors.lightGrey,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 4),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          MainBody(
                                                            title:
                                                                provider
                                                                    .planslist[index]
                                                                    .planName,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          SizedBox(height: 2),
                                                          MainBody(
                                                            title:
                                                                "Order as you go",
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontcolor:
                                                                Colors.grey,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          MainBody(
                                                            title:
                                                                provider
                                                                    .planslist[index]
                                                                    .offerPrice,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontcolor:
                                                                AppColors
                                                                    .orange,
                                                          ),

                                                          MainBody(
                                                            title: "plan price",
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 16),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  right: 8.0,
                                                                ),
                                                            child: MainBody(
                                                              title:
                                                                  provider
                                                                      .planslist[index]
                                                                      .description,
                                                              fontSize: 12,
                                                              fontcolor:
                                                                  Colors
                                                                      .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  GestureDetector(
                                                    onTap: () {
                                                      PlanDetailsBottomSheet.show(
                                                        context,

                                                        planDuration:
                                                            provider
                                                                .planslist[index]
                                                                .durationType,
                                                        planType:
                                                            provider
                                                                .planslist[index]
                                                                .planName,
                                                        mealTypes:
                                                            provider
                                                                .planslist[index]
                                                                .description,
                                                        currentPrice:
                                                            provider
                                                                .planslist[index]
                                                                .offerPrice,
                                                        originalPrice:
                                                            provider
                                                                .planslist[index]
                                                                .price,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 10,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color: AppColors.orange,
                                                      ),
                                                      child: Center(
                                                        child: MainBody(
                                                          title: "Subscribe",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontcolor:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Positioned(
                                        //   left: 118,
                                        //   top: 1,
                                        //   child: AnimatedBuilder(
                                        //     animation: _controller,
                                        //     builder: (context, child) {
                                        //       return Container(
                                        //         padding:
                                        //             const EdgeInsets.symmetric(
                                        //               horizontal: 32,
                                        //               vertical: 1,
                                        //             ),
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(
                                        //                 555,
                                        //               ),
                                        //           color: AppColors.white,
                                        //         ),
                                        //         child: const MainBody(
                                        //           title: " Recommended",
                                        //           fontSize: 11,
                                        //           fontWeight: FontWeight.w500,
                                        //           fontcolor: AppColors.white,
                                        //         ),
                                        //       );
                                        //     },
                                        //   ),
                                        // ),

                                        // Positioned(
                                        //   left: 120,
                                        //   top: 1,
                                        //   child: AnimatedBuilder(
                                        //     animation: _controller,
                                        //     builder: (context, child) {
                                        //       return CustomPaint(
                                        //         painter: ConicGlowBorderPainter(
                                        //           rotation: _controller.value,
                                        //         ),
                                        //         child: Container(
                                        //           padding:
                                        //               const EdgeInsets.symmetric(
                                        //                 horizontal: 30,
                                        //                 vertical: 1,
                                        //               ),
                                        //           decoration: BoxDecoration(
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                   555,
                                        //                 ),
                                        //             color: AppColors.white,
                                        //           ),
                                        //           child: const MainBody(
                                        //             title: "Recommended",
                                        //             fontSize: 11,
                                        //             fontWeight: FontWeight.w500,
                                        //             fontcolor: AppColors.orange,
                                        //           ),
                                        //         ),
                                        //       );
                                        //     },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              MainBody(title: "Why Subscribe?", fontSize: 16),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.1),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.yellowTransparent,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.orange
                                                      .withOpacity(0.1),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Icon(
                                              Icons.restaurant_menu,
                                              color: AppColors.orange,
                                              size: 24,
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'Fresh Daily',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Prepared fresh every day',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                              height: 1.3,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.1),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.yellowTransparent,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.orange
                                                      .withOpacity(0.1),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Icon(
                                              Icons.calendar_today_outlined,
                                              color: AppColors.orange,
                                              size: 24,
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'Flexible',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Skip or pause anytime',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                              height: 1.3,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
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
      },
    );
  }
}
