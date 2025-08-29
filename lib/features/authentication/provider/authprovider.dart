import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authprovider extends ChangeNotifier {
  bool isloading = false;

  openLogin() {
    Future.delayed(const Duration(milliseconds: 4000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool islogin = prefs.getBool(Appstring.loginstatus) ?? false;
      log("login status $islogin ");
      if (islogin) {
        int mentorid = prefs.getInt('mentorid') ?? 0;
        log("mentor id in splashscreen >>>>>>>>>>>>>>>>>>> $mentorid");

        return navigatorKey.currentContext?.go('/home');
      } else {
        return navigatorKey.currentContext?.go('/login');
      }
    });
  }
}
