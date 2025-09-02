import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AlertType { info, error, warning }

class UiUtils {
  static alert(String text, AlertType type,
      {String title = "", Function? onTap}) {
    var header = title;
    if (header.isEmpty) {
      switch (type) {
        case AlertType.error:
          header = "Error";
          break;
        case AlertType.info:
          header = "Info";
          break;
        case AlertType.warning:
          header = "Warning";
          break;
      }
    }
    Get.closeCurrentSnackbar();
    Get.snackbar(header, text,
        duration: Duration(seconds: type == AlertType.error ? 10 : 5),
        backgroundColor: Colors.black.withOpacity(0.8),
        colorText: Colors.white, onTap: (snack) {
      if (onTap != null) {
        onTap();
      }
    }, margin: const EdgeInsets.all(15));
  }
}
