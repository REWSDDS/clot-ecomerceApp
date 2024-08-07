// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentModelAdapter extends TypeAdapter<PaymentModel> {
  @override
  final int typeId = 4;

  @override
  PaymentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentModel(
      cardHolderName: fields[3] as String,
      karta: fields[4] as Karta,
      cardNuber: fields[0] as String,
      ccv: fields[1] as int,
      expDate: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cardNuber)
      ..writeByte(1)
      ..write(obj.ccv)
      ..writeByte(2)
      ..write(obj.expDate)
      ..writeByte(3)
      ..write(obj.cardHolderName)
      ..writeByte(4)
      ..write(obj.karta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KartaAdapter extends TypeAdapter<Karta> {
  @override
  final int typeId = 5;

  @override
  Karta read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Karta.humo;
      case 1:
        return Karta.uzcard;
      default:
        return Karta.humo;
    }
  }

  @override
  void write(BinaryWriter writer, Karta obj) {
    switch (obj) {
      case Karta.humo:
        writer.writeByte(0);
        break;
      case Karta.uzcard:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KartaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
