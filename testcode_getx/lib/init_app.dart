import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testcode/controllers/loader_controller.dart';
import 'package:testcode/controllers/settings_controller.dart';
import 'package:testcode/controllers/tab_controller.dart';
import 'package:testcode/controllers/todo_controller.dart';
import 'package:testcode/controllers/weather_controller.dart';
import 'package:testcode/models/task_dto.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  _registerAllAdapters();
  _initializeControllers();
}

_initializeControllers() {
  Get.lazyPut(() => SettingsController());
  Get.lazyPut(() => TodoController());
  Get.lazyPut(() => LoaderController());
  Get.lazyPut(() => WeatherController());
  Get.lazyPut(() => TabsController());
}

_registerAllAdapters() {
  Hive.registerAdapter(TaskDtoAdapter());
}
