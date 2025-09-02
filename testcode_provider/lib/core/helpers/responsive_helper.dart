import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static const double mobileBreakpoint = 400;
  static const double tabletBreakpoint = 1100;
  static const double wideScreenBreakPoint = 1400;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  static bool get isMobile => ResponsiveHelper.screenWidth <= 700;

  static bool get isTablet =>
      ResponsiveHelper.screenWidth < 929 && ResponsiveHelper.screenWidth >= 701;

  static bool get isLargeScreen => ResponsiveHelper.screenWidth >= 1100;

  static bool get isWideScreen => ResponsiveHelper.screenWidth > 1400;

  static bool get isLandscape =>
      ResponsiveHelper.orientation == Orientation.landscape;

  static bool isMobilePlatform() {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      return true;
    }
    return false;
  }
}
