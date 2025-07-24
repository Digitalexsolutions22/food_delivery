import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/fonts.dart';
import 'package:food_delivery/constants/inputfield.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/hepler/mediahelper.dart';

Future<void> address(BuildContext context, bool homeexist) {
  final formKey = GlobalKey<FormState>();
  final receiverNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final mobileController = TextEditingController();
  final postcodeController = TextEditingController();
  final landmarkController = TextEditingController();
  String? selectedState;

  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: AppColors.white,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 16,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainBody(
                          title: "Address Details",
                          fontcolor: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.gray),
                            ),
                            child: Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      width: Mediahelper.getWidth(context) * 0.8,
                      child: MainBody(
                        title:
                            "Complete address would assists better us in serving you",
                        fontcolor: AppColors.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    MainBody(
                      title: "Select Address",
                      fontcolor: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        if (!homeexist)
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.limeGreen),
                            ),
                            child: Center(
                              child: MainBody(
                                title: "Others",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontcolor: AppColors.gray,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 10),

                    InputField(
                      controller: receiverNameController,
                      hintText: "Receivers Name",
                      borderRadius: 5,
                      height: 50,
                    ),
                    SizedBox(height: 10),

                    InputField(
                      controller: addressController,
                      hintText: "Complete address",
                      borderRadius: 5,
                      height: 50,
                    ),
                    SizedBox(height: 10),

                    InputField(
                      controller: cityController,
                      hintText: "City",
                      borderRadius: 5,
                      height: 50,
                    ),
                    SizedBox(height: 10),

                    InputField(
                      controller: mobileController,
                      hintText: "Mobile Number",
                      keyboardType: TextInputType.numberWithOptions(),
                      borderRadius: 5,
                      height: 50,
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            value: selectedState,
                            hint: Text(
                              "Select State",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: AppFonts.roboto,
                                fontSize: 13,
                                color: AppColors.gray,
                              ),
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: AppColors.gray,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            items:
                                states.map((String state) {
                                  return DropdownMenuItem<String>(
                                    value: state,
                                    child: Text(
                                      state,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedState = newValue;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InputField(
                            controller: postcodeController,
                            hintText: "Post code",
                            keyboardType: TextInputType.numberWithOptions(),
                            borderRadius: 5,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    InputField(
                      controller: landmarkController,
                      hintText: "Landmark (Optional)",
                      borderRadius: 5,
                      height: 50,
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Just close sheet
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.orange,
                              ),
                              child: Center(
                                child: MainBody(
                                  title: "Save Address",
                                  fontcolor: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
