import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/enms.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/appbar.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/customwidgets/text/continerdecoration.dart';
import 'package:food_delivery/features/home/provider/homeprovider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyorderScreen extends StatefulWidget {
  final String? orderStatus;
  const MyorderScreen({super.key, this.orderStatus});

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

  void _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<Homeprovider>(context, listen: false);
    provider.getSchedule("1");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(
      builder: (context, provider, _) {
        final data = provider.scheduleList;
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
                                height: 46,
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.orange,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    // Background fill animation
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        curve: Curves.easeInOut,
                                        width:
                                            screentype == Myorders.currentorder
                                                ? 200
                                                : 0,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Centered text above fill
                                    Center(
                                      child: MainBody(
                                        title: "Current Orders",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                height: 46,
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.orange,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    // Background fill animation
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        curve: Curves.easeInOut,
                                        width:
                                            screentype == Myorders.orderhisstory
                                                ? 200
                                                : 0,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Centered text above fill
                                    Center(
                                      child: MainBody(
                                        title: "Order History",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                          itemCount: data.length,
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
                                              title: "Schedule Id: ",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontcolor: AppColors.black,
                                            ),
                                            MainBody(
                                              title: data[index].scheduleId,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontcolor: Colors.black87,
                                            ),
                                          ],
                                        ),

                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color: AppColors.softYellow,
                                            border: Border.all(
                                              color: AppColors.lightGrey,
                                            ),
                                          ),
                                          child: Text(
                                            data[index].deliveryStatus,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MainBody(
                                                title: data[index].mealTime,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontcolor: AppColors.black,
                                              ),
                                              // SizedBox(height: 4),
                                              // MainBody(
                                              //   title: "Quantity: 1 • ₹120",
                                              //   fontSize: 14,
                                              //   fontcolor: Colors.black54,
                                              // ),
                                            ],
                                          ),
                                        ),
                                        if (data[index].deliveryStatus
                                                .toLowerCase() ==
                                            "preparing")
                                          Lottie.asset(
                                            AppImages.preparingblue,
                                            height: 60,
                                            width: 70,
                                            repeat: true,
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.1),
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFF7F7F7),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 15,
                                                width: 15,
                                                child: Image.asset(
                                                  AppImages.clock,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              MainBody(
                                                title:
                                                    "Delivery date: ${data[index].deliveryDate}",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontcolor: Colors.black54,
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
                                                  AppImages.location,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              MainBody(
                                                title: "HSR Layout, Sector 1",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontcolor: Colors.black54,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        _makePhoneCall('9234567810');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.orange,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.call,
                                                size: 22,
                                                color: AppColors.orange,
                                              ),
                                              SizedBox(width: 4),
                                              MainBody(
                                                title: "Call Now",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontcolor: AppColors.orange,
                                              ),
                                            ],
                                          ),
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
                                              title: "Order",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
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
                                          title: 'Delivered',
                                          backgroundColor: AppColors.freshGreen,
                                          fontcolor: AppColors.white,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    MainBody(
                                      title: "Homestyle Dal Chawal",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontcolor: AppColors.black,
                                    ),
                                    SizedBox(height: 4),
                                    MainBody(
                                      title: "Quantity: 1 • ₹120",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontcolor: Colors.black54,
                                    ),
                                    SizedBox(height: 6),
                                    MainBody(
                                      title: "2 Hours Ago",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontcolor: Colors.black54,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        StatusTag(
                                          title: 'Reorder',
                                          backgroundColor:
                                              AppColors.softYellow1,
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
      },
    );
  }
}
