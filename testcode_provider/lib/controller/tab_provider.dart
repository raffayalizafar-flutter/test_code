import 'package:flutter/material.dart';

enum HomeTabs {
  todo('Todo'),
  weather('Weather');

  const HomeTabs(this.enumName);
  final String enumName;
}

class TabsProvider extends ChangeNotifier {
  HomeTabs _currentHomeTab = HomeTabs.todo;

  HomeTabs get currentHomeTab => _currentHomeTab;

  void changeHomeTab(HomeTabs value) {
    if (_currentHomeTab != value) {
      _currentHomeTab = value;
      notifyListeners();
    }
  }
}
