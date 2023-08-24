import 'package:flutter/material.dart';

class TargetProvider with ChangeNotifier {
  int? _target;

  int? get target => _target; 

  void setTarget(int target) {
    _target = target;
    notifyListeners();
  }
}