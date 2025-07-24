import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profileprovider with ChangeNotifier {
  bool loading = false;
  bool cartloading = false;
  isloading(bool? load) {
    if (load != null) {
      loading = load;
    } else {
      loading = !loading;
    }
  }

  String? selectedState;

  final formkey = GlobalKey<FormState>();
  final receiverNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postcodeController = TextEditingController();
  final mobileController = TextEditingController();
  final landmarkController = TextEditingController();
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();

  Future<void> logoutUser() async {
    // 1. Clear SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // navigatorKey.currentContext?.go('/login');
  }
}
