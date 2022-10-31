// ignore_for_file: constant_identifier_names

import 'package:flutter/rendering.dart';

class LocaleConstants {
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "assets/translations";
  static const List<Locale> SUPPORTED_LOCALE = [
    LocaleConstants.EN_LOCALE,
    LocaleConstants.TR_LOCALE
  ];
}
