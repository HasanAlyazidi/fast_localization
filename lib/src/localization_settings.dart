import 'package:flutter/material.dart' show Locale;
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationSettings {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const String _languageCodeKey = 'Localization::languageCode';
  static const String _countryCodeKey = 'Localization::countryCode';

  static Future<Locale?> get() async {
    final SharedPreferences prefs = await _prefs;

    String? languageCode = prefs.getString(_languageCodeKey);
    String? countryCode = prefs.getString(_countryCodeKey);

    return languageCode != null ? Locale(languageCode, countryCode) : null;
  }

  static Future<void> save(languageCode, countryCode) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString(_languageCodeKey, languageCode);
    await prefs.setString(_countryCodeKey, countryCode);
  }
}
