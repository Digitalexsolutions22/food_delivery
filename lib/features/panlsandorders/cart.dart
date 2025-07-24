import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images1.dart';
import 'package:food_delivery/custom_widgets/continerdecoration.dart';
import 'package:food_delivery/custom_widgets/text.dart';

class CartSceeen extends StatelessWidget {
  const CartSceeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          // Custom AppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 8),
                          const MainBody(
                            title: "Cart (1 items)",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontcolor: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),

          // Divider just below the AppBar
          SliverToBoxAdapter(
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black, // or AppColors.gray.withOpacity(0.2)
                    blurRadius: 6,
                    offset: Offset(0, 2), // shadow position: down
                  ),
                ],
              ),
            ),
          ),

          // List of cart items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    decoration: defaultBoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainBody(
                          title: "Your Order",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontcolor: AppColors.black,
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1, color: AppColors.lightGrey),
                        SizedBox(height: 20),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: AppColors.black,
                                        ),

                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.asset(
                                            AppImages1.productimage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        height: 70,
                                        width: 100,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MainBody(
                                              title: "Poha with Sev",
                                              maxlines: 2,
                                              applymaxlines: true,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontcolor: AppColors.black,
                                            ),

                                            MainBody(
                                              title: "₹65",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontcolor: AppColors.orange,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  CircleAvatar(
                                    radius: 15,

                                    backgroundColor: AppColors.lightGrey,
                                    child: Image.asset(
                                      AppImages1.subtract,
                                      scale: 3,
                                    ),
                                  ),
                                  MainBody(
                                    title: "1",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontcolor: AppColors.orange,
                                  ),
                                  CircleAvatar(
                                    radius: 15,

                                    backgroundColor: AppColors.orange,
                                    child: Image.asset(
                                      AppImages1.plus,
                                      scale: 3,
                                      color: AppColors.white,
                                    ),
                                  ),

                                  Image.asset(
                                    AppImages1.delete,
                                    scale: 3,
                                    color: AppColors.orange,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
