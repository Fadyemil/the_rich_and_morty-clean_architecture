// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charaters_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharatersEntitiesAdapter extends TypeAdapter<CharatersEntities> {
  @override
  final int typeId = 0;

  @override
  CharatersEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharatersEntities(
      name: fields[0] as String,
      status: fields[1] as String,
      species: fields[2] as String,
      gender: fields[3] as String,
      locationName: fields[4] as String,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharatersEntities obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.species)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.locationName)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharatersEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
