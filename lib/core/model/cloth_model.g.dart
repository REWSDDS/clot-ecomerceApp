// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClothModelAdapter extends TypeAdapter<ClothModel> {
  @override
  final int typeId = 1;

  @override
  ClothModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClothModel(
      image: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as num,
      colorName: (fields[5] as List).cast<String>(),
      oldPrice: fields[7] as double,
      disCount: fields[6] as bool,
      color: (fields[4] as List).cast<int>(),
      pickedColor: fields[8] as int?,
      pickedSize: fields[9] as ClothSize?,
      size: (fields[3] as List).cast<ClothSize>(),
    );
  }

  @override
  void write(BinaryWriter writer, ClothModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.colorName)
      ..writeByte(6)
      ..write(obj.disCount)
      ..writeByte(7)
      ..write(obj.oldPrice)
      ..writeByte(8)
      ..write(obj.pickedColor)
      ..writeByte(9)
      ..write(obj.pickedSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClothModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClothSizeAdapter extends TypeAdapter<ClothSize> {
  @override
  final int typeId = 2;

  @override
  ClothSize read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ClothSize.xs;
      case 1:
        return ClothSize.s;
      case 2:
        return ClothSize.m;
      case 3:
        return ClothSize.l;
      case 4:
        return ClothSize.xl;
      case 5:
        return ClothSize.xxl;
      default:
        return ClothSize.xs;
    }
  }

  @override
  void write(BinaryWriter writer, ClothSize obj) {
    switch (obj) {
      case ClothSize.xs:
        writer.writeByte(0);
        break;
      case ClothSize.s:
        writer.writeByte(1);
        break;
      case ClothSize.m:
        writer.writeByte(2);
        break;
      case ClothSize.l:
        writer.writeByte(3);
        break;
      case ClothSize.xl:
        writer.writeByte(4);
        break;
      case ClothSize.xxl:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClothSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
