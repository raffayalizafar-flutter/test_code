import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/padding_const.dart';

class CustomDialogWrapper extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const CustomDialogWrapper({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(Random().toString()),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          backgroundColor: ColorConst.getDialogBg(context),
          insetPadding: const EdgeInsets.all(PaddingConst.innerPadding),
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size(
                width ?? MediaQuery.of(context).size.width * 0.8,
                height ?? MediaQuery.of(context).size.height * 0.5,
              ),
            ),
            child: Padding(
              padding:
                  padding ?? const EdgeInsets.all(PaddingConst.innerPadding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
