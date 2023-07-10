import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Shader getLinearGradient(
    Color color1, Color color2, double start, double middle) {
  return ui.Gradient.linear(
    Offset(start, 20),
    Offset(middle, 20),
    <Color>[
      color1,
      color2,
    ],
  );
}
