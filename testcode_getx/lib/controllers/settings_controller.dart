import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testcode/core/theme/theme.dart';

enum AppearanceType { light, dark, system }

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  var themeMode = ThemeMode.light.obs;
  var theme = AppearanceType.light.obs;

  ThemeData getCurrentTheme() {
    switch (theme.value) {
      case AppearanceType.dark:
        return Styles.darkTheme;
      case AppearanceType.light:
        return Styles.lightTheme;
      default:
        return Styles.lightTheme;
    }
  }

  Future<void> changeAppTheme() async {
    theme.value = theme.value == AppearanceType.light
        ? AppearanceType.dark
        : AppearanceType.light;
  }
}
