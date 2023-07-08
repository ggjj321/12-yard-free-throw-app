import 'package:flutter/material.dart';
import 'package:free_throw_phone/page/select_mode_page.dart';

void main() {
  runApp(const FreeThrowApp());
}

class FreeThrowApp extends StatelessWidget {
  const FreeThrowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "football",
        home: SelectModePage(),
    );
  }
}

