import 'package:flutter/material.dart';

class LoaderProvider extends ChangeNotifier {
  bool _isApiLoading = false;

  bool get isApiLoading => _isApiLoading;

  void setLoading(bool value) {
    if (_isApiLoading != value) {
      _isApiLoading = value;
      notifyListeners();
    }
  }
}
