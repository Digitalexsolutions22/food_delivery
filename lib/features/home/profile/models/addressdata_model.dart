import 'package:hive/hive.dart';

part 'addressdata_model.g.dart';

@HiveType(typeId: 2)
class AddressdataModel extends HiveObject {
  @HiveField(0)
  final String addressId;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String receiverName;

  @HiveField(3)
  final String fullAddress;

  @HiveField(4)
  final String city;

  @HiveField(5)
  final String state;

  @HiveField(6)
  final String postcode;

  @HiveField(7)
  final String mobile;

  @HiveField(8)
  final String? landmark;

  AddressdataModel({
    required this.addressId,
    required this.type,
    required this.receiverName,
    required this.fullAddress,
    required this.city,
    required this.state,
    required this.postcode,
    required this.mobile,
    this.landmark,
  });
}
