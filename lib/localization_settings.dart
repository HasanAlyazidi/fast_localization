library flutter_localization;

import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationSettings {
  static const String _languageCodeKey = 'Localization::languageCode';
  static const String _countryCodeKey = 'Localization::countryCode';

  static dynamic get() async {
    var prefs = await SharedPreferences.getInstance();
    var languageCode = await prefs.get(_languageCodeKey);
    var countryCode = await prefs.get(_countryCodeKey);

    return languageCode != null
      ? Locale(languageCode, countryCode)
      : null;
  }

  static save(languageCode, countryCode) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, languageCode);
    await prefs.setString(_countryCodeKey, countryCode);
  }
}
