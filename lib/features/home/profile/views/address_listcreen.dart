import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/features/home/profile/views/add_address.dart';
import 'package:food_delivery/features/home/profile/views/options.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 36),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.arrow_back, size: 24),
                  SizedBox(width: 10),
                  MainBody(
                    title: "Addresses",
                    fontSize: 18,
                    fontcolor: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 2, color: AppColors.gray),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      // Add New Address
                      GestureDetector(
                        onTap: () {
                          address(context, false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: AppColors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.plas,
                                height: 15,
                                color: AppColors.black,
                              ),
                              SizedBox(width: 10),
                              MainBody(
                                title: "Add New Address",
                                applymaxlines: true,
                                maxlines: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontcolor: AppColors.grayDark,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Address Card (Dummy UI)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.gray.withAlpha(117),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.home_outlined),
                                SizedBox(width: 5),
                                MainBody(
                                  title: "home",
                                  applymaxlines: true,
                                  maxlines: 1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                Spacer(),
                                Image.asset(AppImages.checkbox, height: 20),
                              ],
                            ),
                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: MainBody(
                                    title:
                                        "Near high school, Nehru Park, Samatha colony 42-5/25",
                                    maxlines: 2,
                                    applymaxlines: true,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainBody(
                                  title: "+91 84578 95876",
                                  maxlines: 2,
                                  applymaxlines: true,
                                  fontSize: 16,
                                ),
                                IconButton(
                                  onPressed: () {
                                    options(context, "1");
                                  },
                                  icon: Image.asset(
                                    AppImages.threedotsiocn,
                                    scale: 6,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
