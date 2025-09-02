import 'package:get/get.dart';

enum HomeTabs {
  todo('Todo'),
  weather('Weather');

  const HomeTabs(this.enumName);
  final String enumName;
}

class TabsController extends GetxController {
  static TabsController instance = Get.find();

  var currentHomeTab = HomeTabs.todo.obs;

  void changeHomeTab(HomeTabs value) {
    currentHomeTab.value = value;
  }
}
