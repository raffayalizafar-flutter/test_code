import 'package:get/get.dart';
import 'package:testcode/core/utils/ui_utils.dart';
import 'package:testcode/views/home_view.dart';

class LoginService {
  static Future<void> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (username == "test" && password == "1234") {
      Get.to(HomeView());
    } else {
      UiUtils.alert("Invalid credentials", AlertType.error);
    }
  }
}
