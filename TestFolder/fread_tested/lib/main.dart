import 'package:flutter/material.dart';

import 'demo/demo_main.dart';
import 'demo/files_page.dart';
import 'demo/live_read.dart';
import 'screens/login.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FRead App",
      theme: ThemeData.dark(),
      home: MyApp(),
    );
  }
}
