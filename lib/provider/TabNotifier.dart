import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TabNotifier extends ChangeNotifier {
  int tabIndex = 0;

  void setTabIndex({required int kValue}) {
    tabIndex = kValue;
    notifyListeners();
  }
}
