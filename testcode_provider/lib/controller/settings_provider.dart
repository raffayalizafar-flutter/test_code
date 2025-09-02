import 'package:flutter/material.dart';
import 'package:testcode/core/theme/theme.dart';

enum AppearanceType { light, dark, system }

class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  AppearanceType _theme = AppearanceType.light;

  ThemeMode get themeMode => _themeMode;
  AppearanceType get theme => _theme;

  ThemeData getCurrentTheme() {
    switch (_theme) {
      case AppearanceType.dark:
        return Styles.darkTheme;
      case AppearanceType.light:
        return Styles.lightTheme;
      default:
        return Styles.lightTheme;
    }
  }

  Future<void> changeAppTheme() async {
    _theme = _theme == AppearanceType.light
        ? AppearanceType.dark
        : AppearanceType.light;
    _themeMode = _theme == AppearanceType.light
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
