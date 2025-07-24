import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/features/home/profile/controllers/adresshiverservice.dart';
import 'package:food_delivery/features/home/profile/provider/profileprovider.dart';
import 'package:food_delivery/features/home/profile/views/add_address.dart';
import 'package:food_delivery/hepler/mediahelper.dart';
import 'package:provider/provider.dart';

Future<void> options(BuildContext context, String id) {
  // sates list

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: AppColors.ligthbackground,
    builder: (context) {
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
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainBody(
                            title: "Options",
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
                                border: Border.all(
                                  color: AppColors.lightBorderGray,
                                ),
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
                              "You can edit or delete your saved address below.",
                          fontcolor: AppColors.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      MainBody(
                        title: "Select Options",
                        fontcolor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),

                      GestureDetector(
                        onTap: () {
                          final addressdata = AddressDataService.getAddressById(
                            id,
                          );
                          provider.loadAddressData(addressdata!);
                          address(
                            context,
                            AddressDataService.isHomeAddressExists() &&
                                provider.selectedType != "home",
                          );
                          // provider.seltedtype("home");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  provider.selectedType == "Edit"
                                      ? AppColors.limeGreen
                                      : AppColors.lightBorderGray,
                            ),
                          ),
                          child: Center(
                            child: MainBody(
                              title: "Edit",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontcolor: AppColors.gray,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      GestureDetector(
                        onTap: () {
                          AddressDataService.deleteAddress(id);
                          provider.getadresses();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.red),
                            color: AppColors.red,
                          ),
                          child: Center(
                            child: MainBody(
                              title: "Delete",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontcolor: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
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
