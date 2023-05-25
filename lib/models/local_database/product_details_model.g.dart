// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

class ProductDetailsAdapter extends TypeAdapter<ProductDetails> {
  @override
  final int typeId = 0;

  @override
  ProductDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetails(
      productName: fields[0] as String,
      netWeight: fields[1] as String,
      cartonToPcs: fields[2] as String,
      cartonPrice: fields[3] as String,
      itemId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.netWeight)
      ..writeByte(2)
      ..write(obj.cartonToPcs)
      ..writeByte(3)
      ..write(obj.cartonPrice)
      ..writeByte(4)
      ..write(obj.itemId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductOrderAdapter extends TypeAdapter<ProductOrder> {
  @override
  final int typeId = 1;

  @override
  ProductOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductOrder(
      productName: fields[0] as String,
      netWeight: fields[1] as String,
      cartonToPcs: fields[2] as String,
      cartonPrice: fields[3] as String,
      itemId: fields[4] as String,
      carton: fields[5] as String,
      piece: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductOrder obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.netWeight)
      ..writeByte(2)
      ..write(obj.cartonToPcs)
      ..writeByte(3)
      ..write(obj.cartonPrice)
      ..writeByte(4)
      ..write(obj.itemId)
      ..writeByte(5)
      ..write(obj.carton)
      ..writeByte(6)
      ..write(obj.piece);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
