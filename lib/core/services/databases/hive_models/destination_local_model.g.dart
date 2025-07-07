// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DestinationLocalModelAdapter extends TypeAdapter<DestinationLocalModel> {
  @override
  final typeId = 1;

  @override
  DestinationLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DestinationLocalModel(
      destinationId: (fields[1] as num?)?.toInt(),
      typeSource: fields[2] as String?,
      typeName: fields[3] as String?,
      name: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DestinationLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.destinationId)
      ..writeByte(2)
      ..write(obj.typeSource)
      ..writeByte(3)
      ..write(obj.typeName)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
