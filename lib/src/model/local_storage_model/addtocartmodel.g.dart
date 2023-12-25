// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addtocartmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddtocartmodelAdapter extends TypeAdapter<Addtocartmodel> {
  @override
  final int typeId = 1;

  @override
  Addtocartmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addtocartmodel(
      cartShippingFee: fields[6] as double,
      cartImageUrl: fields[5] as String,
      productName: fields[0] as String,
      productColor: fields[1] as String,
      productSize: fields[2] as String,
      productQuantity: fields[3] as int,
      productPrice: fields[4] as double? ?? 0.0, 
      cartServiceCharged: fields[7]  as double? ?? 0.0,
    );
  }

  @override
  void write(BinaryWriter writer, Addtocartmodel obj) {
    writer
      ..writeByte(7)
      ..write(obj.cartServiceCharged)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.productColor)
      ..writeByte(2)
      ..write(obj.productSize)
      ..writeByte(3)
      ..write(obj.productQuantity)
      ..writeByte(4)
      ..write(obj.productPrice)
      ..writeByte(5)
      ..write(obj.cartImageUrl)
      ..writeByte(6)
      ..write(obj.cartShippingFee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddtocartmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
