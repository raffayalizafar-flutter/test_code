import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:testcode/models/task_dto.dart';

class TodoController extends GetxController {
  static TodoController instance = Get.find();
  final String boxName = 'todos';

  late Box<TaskDto> box;

  RxList<TaskDto> todos = <TaskDto>[].obs;
  RxList<TaskDto> completed = <TaskDto>[].obs;
  RxList<TaskDto> remaining = <TaskDto>[].obs;

  Rx<TaskDto> newTodo = TaskDto.empty().obs;

  @override
  void onInit() {
    super.onInit();
    _initBox();
  }

  Future<void> _initBox() async {
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<TaskDto>(boxName);
    } else {
      box = await Hive.openBox<TaskDto>(boxName);
    }
    _loadTodos();
  }

  void _loadTodos() {
    todos.assignAll(box.values);
    _refreshCompletedAndRemaining();
  }

  Future<void> addTodo(TaskDto todo) async {
    await box.put(todo.id, todo);
    todos.add(todo);
    _refreshCompletedAndRemaining();
    newTodo.value = TaskDto.empty();
  }

  Future<void> updateTodo(TaskDto todo) async {
    if (todo.isCompleted) {
      todo = todo.copyWith(isCompleted: false);
    } else {
      todo = todo.copyWith(isCompleted: true);
    }
    await box.put(todo.id, todo);
    _loadTodos();
  }

  Future<void> deleteTodo(String id) async {
    await box.delete(id);
    todos.removeWhere((item) => item.id == id);
    _refreshCompletedAndRemaining();
  }

  void _refreshCompletedAndRemaining() {
    completed.assignAll(todos.where((t) => t.isCompleted));
    remaining.assignAll(todos.where((t) => !t.isCompleted));
  }
}
