// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JenreAdapter extends TypeAdapter<Jenre> {
  @override
  final int typeId = 0;

  @override
  Jenre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jenre(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Jenre obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jenreMusic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
