import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fread/splash_screen.dart';
import 'package:get/get.dart' hide Trans;
import 'package:sizer/sizer.dart';
import 'Screens/auth/Login/login_screen.dart';
import 'Screens/auth/Register/register_screen.dart';
import 'Screens/auth/Welcome/welcome_screen.dart';
import 'Screens/home/Book/book_detail.dart';
import 'Screens/home/Main/main_screen.dart';
import 'Screens/home/live_read/live_read.dart';
import 'Screens/intro/introduction_screen.dart';
import 'Screens/components/theme_data.dart';
import 'constants/locale_const.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FRead ',
          theme: kThemeData,
          supportedLocales: LocaleConstants.SUPPORTED_LOCALE,
          localizationsDelegates: context.localizationDelegates,
          locale: Get.deviceLocale,
          initialRoute: "/",
          routes: {
            "/": (context) => const SplashScreenPage(),
            '/intro': ((context) => const IntroScreen()),
            '/welcome': ((context) => const WelcomeScreen()),
            '/login': ((context) => const LoginScreen()),
            '/register': ((context) => const RegisterScreen()),
            '/book-detail': ((context) => BookDetail()),
            '/live-read': ((context) => const LiveRead()),
            '/home': ((context) => const HomeScreen()),
          },
        );
      },
    );
  }
}