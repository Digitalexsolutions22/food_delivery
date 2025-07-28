import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/constants/images1.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/customwidgets/text/continerdecoration.dart';
import 'package:lottie/lottie.dart';

class CartSceeen extends StatefulWidget {
  const CartSceeen({super.key});

  @override
  State<CartSceeen> createState() => _CartSceeenState();
}

class _CartSceeenState extends State<CartSceeen> {
  bool promoanime = false;
  int quantity = 1;
  String selectedTimeSlot = "12:30 PM - 01:00 PM";
  String selectedPaymentMethod = "Credit / Debit Card";
  TextEditingController promoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          CustomScrollView(
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
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),

              // List of cart items
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            width: double.infinity,
                            decoration: defaultBoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MainBody(
                                    title: "Your Order",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontcolor: AppColors.black,
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: AppColors.lightGrey,
                                ),
                                SizedBox(height: 10),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 2,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 77,
                                            width: 77,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.black,
                                            ),

                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                AppImages1.productimage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MainBody(
                                                  title: "Poha with Sev",
                                                  maxlines: 2,
                                                  applymaxlines: true,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  fontcolor: AppColors.black,
                                                ),

                                                MainBody(
                                                  title: "₹65",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  fontcolor: AppColors.orange,
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    SizedBox(width: 10),
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (quantity > 1) {
                                                          setState(() {
                                                            quantity--;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 27,
                                                        height: 27,
                                                        decoration:
                                                            BoxDecoration(
                                                              color:
                                                                  Colors
                                                                      .grey[200],
                                                              shape:
                                                                  BoxShape
                                                                      .circle,
                                                            ),
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                          ),
                                                      child: Text(
                                                        '$quantity',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          quantity++;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 26,
                                                        height: 26,
                                                        decoration:
                                                            BoxDecoration(
                                                              color:
                                                                  AppColors
                                                                      .orange,
                                                              shape:
                                                                  BoxShape
                                                                      .circle,
                                                            ),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 20),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Image.asset(
                                                        AppImages1.delete,
                                                        scale: 4,
                                                        color: AppColors.orange,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 0.1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.orange,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Delivery Address',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'HSR Layout, Sector 1, Bangalore - 560102',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () {
                                    // Handle change address
                                  },
                                  child: Text(
                                    'Change Address',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.orange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 0.1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.orange,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Delivery Time',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _buildTimeSlot('12:30 PM - 01:00 PM'),
                                    _buildTimeSlot('01:00 PM - 01:30 PM'),
                                    _buildTimeSlot('01:30 PM - 02:00 PM'),
                                    _buildTimeSlot('08:00 PM - 09:00 PM'),
                                    _buildTimeSlot('09:00 PM - 10:00 PM'),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // Promo Code Section
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 0.1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_offer_outlined,
                                      color: AppColors.orange,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Promo Code',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: promoController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.grayLight,
                                          hintText: 'Enter Promo Code',
                                          hintStyle: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.grey[300]!,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.grey[300]!,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide(
                                              color: AppColors.orange,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          promoanime = true;
                                        });

                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            setState(() {
                                              promoanime = false;
                                            });
                                          },
                                        );
                                      },

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.orange,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Apply',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 0.1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Payment',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                _buildPaymentOption(
                                  'Credit / Debit Card',
                                  AppImages.cardicon,
                                  20,
                                ),
                                SizedBox(height: 8),
                                _buildPaymentOption(
                                  'Cash on Delivery',
                                  AppImages.codicon,
                                  30,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // Bill Summary Section
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 0.1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bill Summary',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text('₹65', style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery Fee',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text('₹25', style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                                Divider(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '₹95',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30),

                          // Place Order Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle place order
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orange,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Place Order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (promoanime) ...[
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Lottie.asset(AppImages.promoanimation),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimeSlot(String timeSlot) {
    bool isSelected = selectedTimeSlot == timeSlot;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeSlot = timeSlot;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          timeSlot,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String image, double size) {
    bool isSelected = selectedPaymentMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.orange : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              color: isSelected ? AppColors.orange : Colors.grey[600],
              height: size,
            ),

            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.orange : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
