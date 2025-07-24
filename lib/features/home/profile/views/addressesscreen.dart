import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/customwidgets/text/body.dart';
import 'package:food_delivery/features/home/profile/controllers/adresshiverservice.dart';
import 'package:food_delivery/features/home/profile/provider/profileprovider.dart';
import 'package:food_delivery/features/home/profile/views/add_address.dart';
import 'package:food_delivery/features/home/profile/views/options.dart';
import 'package:provider/provider.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Profileprovider>().getadresses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Profileprovider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(title: Text("Addresses")),
                    SizedBox(height: 20),
                    // add new
                    GestureDetector(
                      onTap: () {
                        provider.clearAllControllers();
                        address(
                          context,
                          AddressDataService.isHomeAddressExists(),
                        );
                        provider.disselectype();
                        log(
                          "the home is exist:  ${AddressDataService.isHomeAddressExists()}",
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.plas,
                              height: 15,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 10),
                            MainBody(
                              title: "Add New Address",
                              applymaxlines: true,
                              maxlines: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontcolor: AppColors.gray,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // adress list
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.addresslist.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await provider.selectadd(
                              provider.addresslist[index].addressId,
                            );
                            await provider.getuserdetails();
                          },
                          child: Container(
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
                                color: AppColors.gray.withAlpha(
                                  117,
                                ), // 46% opacity
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                provider
                                                            .addresslist[index]
                                                            .type ==
                                                        "home"
                                                    ? AppImages.home
                                                    : AppImages.other,
                                                height: 22,
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        MainBody(
                                                          title:
                                                              provider
                                                                  .addresslist[index]
                                                                  .type,
                                                          applymaxlines: true,
                                                          maxlines: 1,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        Image.asset(
                                                          provider.seletedadress ==
                                                                  provider
                                                                      .addresslist[index]
                                                                      .addressId
                                                              ? AppImages
                                                                  .checkboxfill
                                                              : AppImages
                                                                  .checkbox,
                                                          height: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    MainBody(
                                                      textAlign: TextAlign.left,
                                                      title:
                                                          "${provider.addresslist[index].fullAddress} ${provider.addresslist[index].city}  ",
                                                      applymaxlines: true,
                                                      maxlines: 2,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontcolor: AppColors.black
                                                          .withAlpha(
                                                            117,
                                                          ), // 46% opacity
                                                    ),
                                                    MainBody(
                                                      textAlign: TextAlign.left,
                                                      title:
                                                          provider
                                                              .addresslist[index]
                                                              .postcode,
                                                      applymaxlines: true,
                                                      maxlines: 2,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontcolor: AppColors.black
                                                          .withAlpha(
                                                            117,
                                                          ), // 46% opacity
                                                    ),
                                                    MainBody(
                                                      textAlign: TextAlign.left,
                                                      title:
                                                          provider
                                                              .addresslist[index]
                                                              .state,
                                                      applymaxlines: true,
                                                      maxlines: 2,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontcolor: AppColors.black
                                                          .withAlpha(
                                                            117,
                                                          ), // 46% opacity
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        MainBody(
                                                          textAlign:
                                                              TextAlign.left,
                                                          title:
                                                              provider
                                                                  .addresslist[index]
                                                                  .mobile,
                                                          applymaxlines: true,
                                                          maxlines: 2,

                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontcolor: AppColors
                                                              .black
                                                              .withAlpha(
                                                                117,
                                                              ), // 46% opacity
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            log(
                                                              provider
                                                                  .addresslist[index]
                                                                  .addressId,
                                                            );
                                                            provider.deleteaddress(
                                                              provider
                                                                  .addresslist[index]
                                                                  .addressId,
                                                            );
                                                            options(
                                                              context,
                                                              provider
                                                                  .editaddress!,
                                                            );
                                                          },
                                                          icon: Image.asset(
                                                            AppImages
                                                                .threedotsiocn,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
