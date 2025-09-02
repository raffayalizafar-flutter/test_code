import 'package:flutter/material.dart';
import 'package:testcode/core/constants/color_const.dart';

class FontConst {
  static TextStyle defaultTextStyle = const TextStyle(
    color: ColorConst.white,
    fontWeight: FontWeight.normal,
    fontSize: 15,
  );

  static TextStyle getContent(BuildContext context) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 15,
      overflow: TextOverflow.visible,
      color: Theme.of(context).brightness == Brightness.light
          ? ColorConst.black
          : ColorConst.white,
    );
  }

  static TextStyle getBoldContent(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      overflow: TextOverflow.visible,
      color: Theme.of(context).brightness == Brightness.light
          ? ColorConst.black
          : ColorConst.white,
    );
  }

    static TextStyle getLargeContent(BuildContext context) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 24,
      overflow: TextOverflow.visible,
      color: Theme.of(context).brightness == Brightness.light
          ? ColorConst.black
          : ColorConst.white,
    );
  }

  static TextStyle getLargeBoldContent(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      overflow: TextOverflow.visible,
      color: Theme.of(context).brightness == Brightness.light
          ? ColorConst.black
          : ColorConst.white,
    );
  }

  static TextStyle greyContent = const TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 15,
    color: ColorConst.greyColor,
    overflow: TextOverflow.visible,
  );

  static const TextStyle smallLightText = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 10,
    color: ColorConst.greyColor,
    overflow: TextOverflow.visible,
  );

  // BUTTON TEXT
  static TextStyle blueTextButton = const TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 15,
    color: ColorConst.activeBlue,
    overflow: TextOverflow.visible,
  );

  static TextStyle redTextButton = const TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 15,
    color: ColorConst.secondary,
    overflow: TextOverflow.visible,
  );
}
