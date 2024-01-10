// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegmodelAdapter extends TypeAdapter<Regmodel> {
  @override
  final int typeId = 1;

  @override
  Regmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Regmodel(
      name: fields[0] as String,
      email: fields[1] as String,
      mobile: fields[2] as int,
      designation: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Regmodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.mobile)
      ..writeByte(3)
      ..write(obj.designation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
