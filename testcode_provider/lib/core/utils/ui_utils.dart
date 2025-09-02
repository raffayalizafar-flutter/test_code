import 'package:flutter/material.dart';

enum AlertType { info, error, warning }

class UiUtils {
  static void alert(
    BuildContext context,
    String text,
    AlertType type, {
    String title = "",
    VoidCallback? onTap,
  }) {
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

    final snackBar = SnackBar(
      content: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                "$header: $text",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: type == AlertType.error ? 10 : 5),
      backgroundColor: Colors.black.withOpacity(0.8),
      margin: const EdgeInsets.all(15),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
