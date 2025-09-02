import 'package:flutter/material.dart';
import 'package:testcode/core/utils/ui_utils.dart';
import 'package:testcode/views/home_view.dart';

class LoginService {
  static Future<void> login(
    BuildContext context,
    String username,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (username == "test" && password == "1234") {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const HomeView()));
    } else {
      UiUtils.alert(context, "Invalid credentials", AlertType.error);
    }
  }
}
