// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/bmi_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BMIRecordAdapter extends TypeAdapter<BMIRecord> {
  @override
  final int typeId = 0;

  @override
  BMIRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BMIRecord(
      bmiScore: fields[0] as double,
      dateTime: fields[1] as DateTime,
      bmiStatus: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BMIRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bmiScore)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.bmiStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BMIRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
