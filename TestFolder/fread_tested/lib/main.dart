import 'package:flutter/material.dart';

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
      home: Login(),
    );
  }
}
