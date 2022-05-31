import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
import 'package:sizer/sizer.dart';
import 'Screens/auth/Login/login_screen.dart';
import 'Screens/auth/Register/register_screen.dart';
import 'Screens/auth/Welcome/welcome_screen.dart';
import 'components/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FRead ',
          theme: kThemeData,
          routes: {
            '/': ((context) => const WelcomeScreen()),
            '/login': ((context) => const LoginScreen()),
            '/register': ((context) => const RegisterScreen()),
          },
        );
      },
    );
  }
}
