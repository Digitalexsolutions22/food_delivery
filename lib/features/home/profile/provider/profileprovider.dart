import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants/strings.dart';
import 'package:food_delivery/features/home/profile/controllers/adresshiverservice.dart';
import 'package:food_delivery/features/home/profile/models/addressdata_model.dart';
import 'package:hive/hive.dart';
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

  // get user selected adress
  AddressdataModel? adress;
  String? seletedadressid;
  String? username;
  String? useremail;
  String? userid;

  getuserdetails() async {
    loading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seletedadressid = prefs.getString(Appstring.addresid).toString();
    adress = AddressDataService.getAddressById(seletedadressid.toString());
    useremail = prefs.getString(Appstring.useremail).toString();
    username = prefs.getString(Appstring.username).toString();
    loading = false;
    notifyListeners();
  }

  bool haveaddress = false;

  adddress(BuildContext context) {
    haveaddress = true;
    notifyListeners();
    Navigator.pop(context);
  }

  String? selectedType = '';

  seltedtype(String type) {
    selectedType = type;
    notifyListeners();
  }

  List<AddressdataModel> addresslist = [];

  disselectype() {
    selectedType = "";
    notifyListeners();
  }

  String seletedadress = "";
  String? editaddress;
  getadresses() async {
    loading = true;
    notifyListeners();
    addresslist = AddressDataService.getAllAddresses();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seletedadress = prefs.getString(Appstring.addresid).toString();
    loading = false;
    notifyListeners();
  }

  // Select adress

  selectadd(String adressid) async {
    loading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Appstring.addresid, adressid);
    seletedadress = adressid;
    log("selected adress $adressid");
    loading = false;
    notifyListeners();
  }

  final formkey = GlobalKey<FormState>();
  final receiverNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postcodeController = TextEditingController();
  final mobileController = TextEditingController();
  final landmarkController = TextEditingController();
  String? selectedState;

  void clearAllControllers() {
    editaddress = null;
    selectedState = null;
    receiverNameController.clear();
    addressController.clear();
    cityController.clear();
    postcodeController.clear();
    mobileController.clear();
    landmarkController.clear();
  }

  void loadAddressData(AddressdataModel address) {
    selectedType = address.type;
    log(address.state);
    selectedState = address.state;
    receiverNameController.text = address.receiverName;
    addressController.text = address.fullAddress;
    cityController.text = address.city;
    postcodeController.text = address.postcode;
    mobileController.text = address.mobile;
    landmarkController.text = address.landmark ?? "";
  }

  deleteaddress(String addressid) async {
    editaddress = addressid;
    log("selected adress $addressid");
  }

  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();

  void getuserdeatisls() async {
    loading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get values from SharedPreferences
    useremail = prefs.getString(Appstring.useremail) ?? "";
    username = prefs.getString(Appstring.username) ?? "";

    // Now set the controller text
    namecontroler.text = username!;
    emailcontroler.text = useremail!;
    loading = false;
    notifyListeners();
  }

  bool edit = false;

  canedit() {
    edit = !edit;
    notifyListeners();
  }

  Future<void> logoutUser() async {
    // 1. Clear SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // 2. Clear specific Hive box (e.g., addressBox)
    final addressBox = Hive.box<AddressdataModel>('addressBox');
    await addressBox.clear();

    // navigatorKey.currentContext?.go('/login');
  }
}
