import 'package:flutter/material.dart';

class TotalShootTime with ChangeNotifier {
  int _totalShootTime = 0;

  int get totalShoottime => _totalShootTime;

  void addTime() {
    _totalShootTime +=1;
    if (_totalShootTime > 50) _totalShootTime = 0;
    notifyListeners();
  }

  void decreaseTime() {
    _totalShootTime -=1;
    if (_totalShootTime < 0) _totalShootTime = 50;
    notifyListeners();
  }
}