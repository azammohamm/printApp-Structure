import 'package:flutter/material.dart';

class BottomNavViewModel extends ChangeNotifier {
  int _bottomNavIndex = 0;

  int get bottomNavIndex => _bottomNavIndex;

  List<IconData> iconList = [
    Icons.home,
    Icons.bar_chart,
    Icons.groups,
    Icons.person,
  ];

  void updateIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }
}





