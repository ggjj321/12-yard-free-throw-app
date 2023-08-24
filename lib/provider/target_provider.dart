import 'package:flutter/material.dart';

class TargetProvider with ChangeNotifier {
  int? _targetX;
  int? _targetY;

  int? get targetX => _targetX; 
  int? get targetY => _targetY; 

  void setTarget(int targetX, int targetY) {
    _targetX = targetX;
    _targetY = targetY;
    notifyListeners();
  }
}