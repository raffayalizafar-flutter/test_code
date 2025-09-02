// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDtoAdapter extends TypeAdapter<TaskDto> {
  @override
  final int typeId = 1;

  @override
  TaskDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDto(
      id: fields[0] as String,
      description: fields[1] as String?,
      title: fields[2] as String?,
      isCompleted: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
