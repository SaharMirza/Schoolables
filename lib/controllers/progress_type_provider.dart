import 'package:flutter/material.dart';

class ProgressProvider with ChangeNotifier {
  late bool inProgress = false;
  late bool cancelled = false;
  late bool completed = false;

  void isSelected(int value) {
    if (value == 0) {
      inProgress = true;
    } else if (value == 1) {
      cancelled = true;
    } else if (value == 2) {
      completed = true;
    }
    notifyListeners();
  }

  bool checkProgress(int value) {
    bool selected = false;
    if (value == 0 && inProgress == true) {
      selected = true;
    }
    if (value == 1 && cancelled == true) {
      selected = true;
    }
    if (value == 2 && completed == true) {
      selected = true;
    }
    notifyListeners();
    return selected;
  }
}
