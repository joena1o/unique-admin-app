import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Function? drawer;

  void setDrawerFunction(Function drawerFunction) {
    drawer = drawerFunction;
    notifyListeners();
  }

  void closeDrawer() {
    drawer!();
  }
}
