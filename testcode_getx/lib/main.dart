import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testcode/controllers/controller.dart';
import 'package:testcode/init_app.dart';
import 'package:testcode/views/home_view.dart';
import 'package:testcode/views/login/login_view.dart';

Future<void> main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Test Code',
        debugShowCheckedModeBanner: false,
        theme: settingsController.getCurrentTheme(),
        home: const HomeView(),
      );
    });
  }
}
