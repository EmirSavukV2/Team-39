import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
import 'package:sizer/sizer.dart';

ThemeData kThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  primarySwatch: const MaterialColor(
    0xff2c3e43, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffeaedef), //10%
      100: Color(0xffcbd4d6), //20%
      200: Color(0xffa8b8bc), //30%
      300: Color(0xff859ca2), //40%
      400: Color(0xff6c878e), //50%
      500: Color(0xff52737c), //60%
      600: Color(0xff47646c), //70%
      700: Color(0xff395157), //80%
      800: Color(0xff2c3e43), //90%
      900: Color(0xff1c292d), //100%
    },
  ),
  fontFamily: "SF_PRO",
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    secondary: kSecondaryColor,
    onSecondary: kPrimaryColor,
    error: Color(0xffea4c89),
    onError: kTextColor,
    background: Colors.white,
    onBackground: kPrimaryColor,
    surface: Color(0xfff5f5f5),
    onSurface: kPrimaryColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: kPrimaryColor,
      fontWeight: FontWeight.w700,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 42.sp : 42.sp,
    ),
    bodyText1: TextStyle(
      color: kTextColor,
      fontWeight: FontWeight.w400,
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 12.sp,
      height: 1.4,
    ),
    button: TextStyle(
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shadowColor: kPrimaryColor,
        elevation: 6,
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 14.sp : 6.sp,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      textStyle: TextStyle(
        color: kPrimaryColor,
        fontSize: SizerUtil.deviceType == DeviceType.mobile ? 14.sp : 6.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
