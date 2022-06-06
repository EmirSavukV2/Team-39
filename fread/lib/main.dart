import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Screens/auth/Login/login_screen.dart';
import 'Screens/auth/Register/register_screen.dart';
import 'Screens/auth/Welcome/welcome_screen.dart';
import 'Screens/home/Book/book-detail.dart';
import 'Screens/home/Main/main_screen.dart';
import 'Screens/intro/introduction_screen.dart';
import 'components/theme_data.dart';
import 'constants/locale_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LocaleConstants.SUPPORTED_LOCALE,
      path: LocaleConstants.LANG_PATH,
      fallbackLocale: LocaleConstants.TR_LOCALE,
      child: const MyApp(),
    ),
  );
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
          supportedLocales: LocaleConstants.SUPPORTED_LOCALE,
          localizationsDelegates: context.localizationDelegates,
          locale: LocaleConstants.TR_LOCALE,
          routes: {
            '/': ((context) => const IntroScreen()),
            '/welcome': ((context) => const WelcomeScreen()),
            '/login': ((context) => const LoginScreen()),
            '/register': ((context) => const RegisterScreen()),
            '/book-detail': ((context) => const BookDetail()),
            '/home': ((context) => const HomeScreen()),
          },
        );
      },
    );
  }
}
