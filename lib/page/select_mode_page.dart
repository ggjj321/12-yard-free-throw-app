import 'package:flutter/material.dart';
import 'package:free_throw_phone/Copmpoents/wave_app_bar.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: waveAppbar("Select Mode Page"),
    );
  }
}
