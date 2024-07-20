import 'package:flutter/material.dart';

class Workpovider with ChangeNotifier {
  final Map<String, bool> _itemStatus = {};

  bool isDone(String key) {
    return _itemStatus[key] ?? false;
  }

  void toggleStatus(String key) {
    _itemStatus[key] = !isDone(key);
    notifyListeners();
  }
}
