import 'package:flutter/material.dart';
import 'package:free_throw_phone/page/select_mode_page.dart';
import 'package:free_throw_phone/page/result_display_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

