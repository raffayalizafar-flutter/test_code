import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testcode/models/task_dto.dart';

class TodoProvider extends ChangeNotifier {
  final String boxName = 'todos';

  Box<TaskDto>? _box;

  final List<TaskDto> _todos = [];
  final List<TaskDto> _completed = [];
  final List<TaskDto> _remaining = [];
  TaskDto newTodo = TaskDto.empty();

  List<TaskDto> get todos => List.unmodifiable(_todos);
  List<TaskDto> get completed => List.unmodifiable(_completed);
  List<TaskDto> get remaining => List.unmodifiable(_remaining);

  Future<void> init() async {
    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box<TaskDto>(boxName);
    } else {
      _box = await Hive.openBox<TaskDto>(boxName);
    }
    _loadTodos();
  }

  void _loadTodos() {
    if (_box == null) return;
    _todos
      ..clear()
      ..addAll(_box!.values);
    _refreshCompletedAndRemaining();
  }

  Future<void> addTodo(TaskDto todo) async {
    if (_box == null) return;
    await _box!.put(todo.id, todo);
    _todos.add(todo);
    _refreshCompletedAndRemaining();
    newTodo = TaskDto.empty();
    notifyListeners();
  }

  Future<void> updateTodo(TaskDto todo) async {
    if (_box == null) return;
    final updated = todo.isCompleted
        ? todo.copyWith(isCompleted: false)
        : todo.copyWith(isCompleted: true);
    await _box!.put(updated.id, updated);
    _loadTodos();
    notifyListeners();
  }

  Future<void> deleteTodo(String id) async {
    if (_box == null) return;
    await _box!.delete(id);
    _todos.removeWhere((item) => item.id == id);
    _refreshCompletedAndRemaining();
    notifyListeners();
  }

  void updateNewTodo(TaskDto todo) {
    newTodo = todo;
    notifyListeners();
  }

  void resetNewTodo() {
    newTodo = TaskDto.empty();
    notifyListeners();
  }

  void _refreshCompletedAndRemaining() {
    _completed
      ..clear()
      ..addAll(_todos.where((t) => t.isCompleted));
    _remaining
      ..clear()
      ..addAll(_todos.where((t) => !t.isCompleted));
  }
}
