import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/font_const.dart';

class Styles {
  static ThemeData get lightTheme => ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    useMaterial3: true,
    primaryColor: ColorConst.primaryLight,
    scaffoldBackgroundColor: Colors.white,
    cupertinoOverrideTheme: const CupertinoThemeData().copyWith(
      primaryColor: ColorConst.primaryLight,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorConst.primaryLight,
      secondary: ColorConst.secondary,
    ),
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(secondary: ColorConst.primaryLight),
      buttonColor: ColorConst.primaryLight,
      textTheme: ButtonTextTheme.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConst.secondary,
      selectionColor: ColorConst.activeBlue,
    ),
    appBarTheme: AppBarTheme(backgroundColor: ColorConst.appBarBackground),
    textTheme: TextTheme(
      bodyLarge: FontConst.defaultTextStyle.copyWith(color: Colors.black),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      },
    ),
    useMaterial3: true,
    cupertinoOverrideTheme: const CupertinoThemeData().copyWith(
      primaryColor: ColorConst.primaryDark,
      brightness: Brightness.dark,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark,
      primary: ColorConst.primaryDark,
      secondary: ColorConst.secondary,
    ),
    brightness: Brightness.dark,
    splashColor: Colors.black,
    primaryColor: ColorConst.primaryDark,
    scaffoldBackgroundColor: Colors.black,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(secondary: ColorConst.primaryDark),
      buttonColor: ColorConst.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConst.primaryDark,
      selectionColor: ColorConst.activeBlue,
    ),
    appBarTheme: AppBarTheme(backgroundColor: ColorConst.darkGreyColor),
    textTheme: TextTheme(bodyLarge: FontConst.defaultTextStyle),
  );

}
