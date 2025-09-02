// lib/core/constants/color_const.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcode/controller/settings_provider.dart';

class ColorConst {
  static const Color primaryLight = Color.fromRGBO(0, 31, 77, 1);
  static const Color primaryDark = Color.fromRGBO(128, 216, 255, 1);

  static const Color secondary = Colors.red;

  static const Color activeBlue = Colors.blue;

  static const Color greenColor = Colors.green;

  static const Color redColor = secondary;

  static const Color buttonDarkColor = primaryLight;

  static const Color transparent = Colors.transparent;

  // BACKGROUND
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const Color appBarBackground = Color.fromRGBO(245, 245, 245, 1);

  static const Color greyColor = Colors.grey;
  static const Color darkGreyColor = Color.fromRGBO(56, 55, 55, 1);

  /// Dynamic theme-aware getters
  static Color getPrimary(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return settings.getCurrentTheme().brightness == Brightness.light
        ? primaryLight
        : primaryDark;
  }

  static Color getBasicBg(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return settings.getCurrentTheme().brightness == Brightness.light
        ? white
        : black;
  }

  static Color getDialogBg(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return settings.getCurrentTheme().brightness == Brightness.light
        ? white
        : darkGreyColor;
  }

  static Color getOppositeBg(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return settings.getCurrentTheme().brightness == Brightness.light
        ? black
        : white;
  }

  static Color getBorderColor(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return settings.getCurrentTheme().brightness == Brightness.light
        ? greyColor
        : darkGreyColor;
  }

  static Color defaultButtonColor(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return settings.getCurrentTheme().brightness == Brightness.light
        ? primaryLight
        : primaryDark;
  }

  static Color getSlidingSegmentedControlBg(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? CupertinoColors.lightBackgroundGray
        : greyColor;
  }
}
