import 'package:hive/hive.dart';
import '../models/addressdata_model.dart'; // Adjust path if needed

class AddressDataService {
  static const String _boxName = 'addressBox';

  /// Initialize Hive & register adapter (call in main)
  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(AddressdataModelAdapter());
    }
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<AddressdataModel>(_boxName);
    }
  }

  /// Add new address with auto-generated ID
  static Future<void> addAddress(AddressdataModel address) async {
    final box = Hive.box<AddressdataModel>(_boxName);

    final autoId = DateTime.now().millisecondsSinceEpoch.toString();

    final addressWithId = AddressdataModel(
      addressId: autoId,
      type: address.type,
      receiverName: address.receiverName,
      fullAddress: address.fullAddress,
      city: address.city,
      state: address.state,
      postcode: address.postcode,
      mobile: address.mobile,
      landmark: address.landmark,
    );

    await box.put(autoId, addressWithId);
  }

  /// Get all saved addresses
  static List<AddressdataModel> getAllAddresses() {
    final box = Hive.box<AddressdataModel>(_boxName);
    return box.values.toList();
  }

  /// Get address by ID
  static AddressdataModel? getAddressById(String id) {
    final box = Hive.box<AddressdataModel>(_boxName);
    return box.get(id);
  }

  /// Update existing address
  static Future<void> updateAddress(
    String id,
    AddressdataModel updatedAddress,
  ) async {
    final box = Hive.box<AddressdataModel>(_boxName);
    await box.put(id, updatedAddress);
  }

  /// Delete address by ID
  static Future<void> deleteAddress(String id) async {
    final box = Hive.box<AddressdataModel>(_boxName);
    await box.delete(id);
  }

  /// Delete all addresses
  static Future<void> clearAll() async {
    final box = Hive.box<AddressdataModel>(_boxName);
    await box.clear();
  }

  /// Check if address exists
  static bool exists(String id) {
    final box = Hive.box<AddressdataModel>(_boxName);
    return box.containsKey(id);
  }

  static bool isHomeAddressExists() {
    final box = Hive.box<AddressdataModel>(_boxName);
    return box.values.any((address) => address.type.toLowerCase() == 'home');
  }
}
