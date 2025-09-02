import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testcode/controllers/controller.dart';

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

  static Color getPrimary() {
    if (settingsController.getCurrentTheme().brightness == Brightness.light) {
      return primaryLight;
    } else {
      return primaryDark;
    }
  }

  static Color getBasicBg() {
    if (settingsController.getCurrentTheme().brightness == Brightness.light) {
      return white;
    } else {
      return black;
    }
  }

  static Color getDialogBg() {
    if (settingsController.getCurrentTheme().brightness == Brightness.light) {
      return white;
    } else {
      return darkGreyColor;
    }
  }

  static Color getOppositeBg() {
    if (settingsController.getCurrentTheme().brightness == Brightness.light) {
      return black;
    } else {
      return white;
    }
  }

  static Color getBorderColor() {
    if (settingsController.getCurrentTheme().brightness == Brightness.light) {
      return greyColor;
    } else {
      return darkGreyColor;
    }
  }

  static Color defaultButtonColor() {
    if (settingsController.getCurrentTheme().brightness == Brightness.light) {
      return primaryLight;
    } else {
      return primaryDark;
    }
  }

  static Color getSlidingSegmentedControlBg(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return CupertinoColors.lightBackgroundGray;
    } else {
      return greyColor;
    }
  }
}
