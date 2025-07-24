import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/fonts.dart';
import 'package:food_delivery/constants/inputfield.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/customwidgets/ux/shortdialogbox.dart';
import 'package:food_delivery/features/home/profile/controllers/adresshiverservice.dart';
import 'package:food_delivery/features/home/profile/models/addressdata_model.dart';
import 'package:food_delivery/features/home/profile/provider/profileprovider.dart';
import 'package:food_delivery/hepler/mediahelper.dart';
import 'package:food_delivery/hepler/validaterhelper.dart';
import 'package:food_delivery/main.dart';
import 'package:provider/provider.dart';

Future<void> address(BuildContext context, bool homeexist) {
  // sates list
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
      log("home exits >>>> $homeexist");
      return Padding(
        padding: EdgeInsets.only(
          top: 16,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Consumer<Profileprovider>(
                builder: (context, provider, _) {
                  return Form(
                    key: provider.formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // header
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
                            homeexist == false
                                ? GestureDetector(
                                  onTap: () {
                                    provider.seltedtype("home");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color:
                                            provider.selectedType == "home"
                                                ? AppColors.limeGreen
                                                : AppColors.lightBorderGray,
                                      ),
                                    ),
                                    child: Center(
                                      child: MainBody(
                                        title: "Home",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontcolor: AppColors.gray,
                                      ),
                                    ),
                                  ),
                                )
                                : SizedBox(),
                            SizedBox(width: homeexist == false ? 10 : 0),
                            GestureDetector(
                              onTap: () {
                                provider.seltedtype("other");
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 20,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color:
                                        provider.selectedType == "other"
                                            ? AppColors.limeGreen
                                            : AppColors.lightBorderGray,
                                  ),
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
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        InputField(
                          controller: provider.receiverNameController,
                          hintText: "Receivers Name",
                          borderRadius: 5,
                          height: 50,
                          validator: (value) {
                            return validateInput(value, "Receivers Name");
                          },
                        ),
                        SizedBox(height: 10),

                        // InputField(
                        //   hintText: "Receivers Name",
                        //   borderRadius: 5,
                        //   height: 50,
                        // ),
                        // SizedBox(height: 10),
                        InputField(
                          controller: provider.addressController,
                          hintText: "Complete address",
                          borderRadius: 5,
                          height: 50,
                          validator: (value) {
                            return validateInput(value, "Complete address");
                          },
                        ),
                        SizedBox(height: 10),
                        InputField(
                          controller: provider.cityController,
                          hintText: "City",
                          borderRadius: 5,
                          height: 50,
                          validator: (value) {
                            return validateInput(value, "City");
                          },
                        ),
                        SizedBox(height: 10),
                        InputField(
                          controller: provider.mobileController,
                          hintText: "Mobile Number",
                          keyboardType: TextInputType.numberWithOptions(),
                          borderRadius: 5,
                          height: 50,
                          validator: (value) {
                            return validateInput(value, "Mobile Number");
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // sate drop down
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: provider.selectedState,
                                hint: Text(
                                  "Select State",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppFonts.roboto,
                                    fontWeight: FontWeight.normal,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a state';
                                  }
                                  return null;
                                },
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
                                    provider.selectedState = newValue;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InputField(
                                keyboardType: TextInputType.numberWithOptions(),
                                controller: provider.postcodeController,
                                hintText: "Post code",
                                borderRadius: 5,
                                height: 50,
                                validator: (value) {
                                  return validateInput(value, "Postcode");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        InputField(
                          controller: provider.landmarkController,
                          hintText: "Landmark (Optional)",
                          borderRadius: 5,
                          height: 50,
                        ),

                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (provider.selectedType != "") {
                                      if (provider.formkey.currentState!
                                          .validate()) {
                                        final newAddress = AddressdataModel(
                                          addressId:
                                              provider.editaddress == null
                                                  ? "" // will be overridden
                                                  : provider.editaddress!,
                                          type:
                                              homeexist == false
                                                  ? provider.selectedType
                                                      .toString()
                                                  : "other",
                                          receiverName:
                                              provider
                                                  .receiverNameController
                                                  .text
                                                  .trim(),
                                          fullAddress:
                                              provider.addressController.text
                                                  .trim(),
                                          city:
                                              provider.cityController.text
                                                  .trim(),
                                          state:
                                              provider.selectedState.toString(),
                                          postcode:
                                              provider.postcodeController.text
                                                  .trim(),
                                          mobile:
                                              provider.mobileController.text
                                                  .trim(),
                                          landmark:
                                              provider.landmarkController.text
                                                  .trim(),
                                        );
                                        if (provider.editaddress == null) {
                                          await AddressDataService.addAddress(
                                            newAddress,
                                          );
                                        } else {
                                          await AddressDataService.updateAddress(
                                            provider.editaddress!,
                                            newAddress,
                                          );
                                          Navigator.pop(context);
                                        }
                                        Navigator.pop(context);
                                      }
                                    } else {
                                      Shortdialogbox.show(
                                        navigatorKey: navigatorKey,
                                        message: "Please select address type.",
                                      );
                                    }

                                    provider.getadresses();

                                    // 🔁 Call the parent submit function
                                    // onSubmit(userRating, review);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.green,
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
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
    },
  );
}
