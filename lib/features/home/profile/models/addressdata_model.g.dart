// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressdata_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressdataModelAdapter extends TypeAdapter<AddressdataModel> {
  @override
  final int typeId = 2;

  @override
  AddressdataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressdataModel(
      addressId: fields[0] as String,
      type: fields[1] as String,
      receiverName: fields[2] as String,
      fullAddress: fields[3] as String,
      city: fields[4] as String,
      state: fields[5] as String,
      postcode: fields[6] as String,
      mobile: fields[7] as String,
      landmark: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressdataModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.addressId)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.receiverName)
      ..writeByte(3)
      ..write(obj.fullAddress)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.postcode)
      ..writeByte(7)
      ..write(obj.mobile)
      ..writeByte(8)
      ..write(obj.landmark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressdataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
