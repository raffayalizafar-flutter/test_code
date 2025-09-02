import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcode/controller/loader_provider.dart';
import 'package:testcode/controller/settings_provider.dart';
import 'package:testcode/controller/tab_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testcode/models/task_dto.dart';
import 'package:testcode/controller/todo_provider.dart';
import 'package:testcode/controller/weather_provider.dart';
import 'package:testcode/views/home_view.dart';

Future<void> main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => LoaderProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => TabsProvider()),
      ],
      child: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return MaterialApp(
            title: 'Test Code',
            debugShowCheckedModeBanner: false,
            theme: settings.getCurrentTheme(),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  _registerAllAdapters();
}

void _registerAllAdapters() {
  Hive.registerAdapter(TaskDtoAdapter());
}
