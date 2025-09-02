import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_dto.g.dart';

@HiveType(typeId: 1, adapterName: "TaskDtoAdapter")
class TaskDto extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final bool isCompleted;

  TaskDto({
    required this.id,
    this.description,
    this.title,
    this.isCompleted = false,
  });

  factory TaskDto.empty() {
    const uuid = Uuid();
    return TaskDto(id: uuid.v1());
  }

  TaskDto copyWith({String? description, String? title, bool? isCompleted}) {
    return TaskDto(
      id: id,
      description: description ?? this.description,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }


  @override
  String toString() =>
      'TaskDto(id: $id, title: $title, description: $description, completed: $isCompleted)';
}
