import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:fast_localization/src/localization_app.dart';
import 'package:fast_localization/src/localization_settings.dart';

String t(String key, [Map<String, String>? params]) {
  return Localization.translate(key, params);
}

class Localization {
  static Map<Locale, Map<String, dynamic>> _languages = {};
  static Locale? _locale;
  static Map<String, dynamic> _localizedStrings = {};

  static List<Locale> supportedLocales = [];

  static Locale get locale {
    if (_locale == null) {
      throw Exception('Make sure to call `Localization.load() first.`');
    }

    return _locale!;
  }

  static String get languageCountry => _locale.toString();

  static Future load(Map<Locale, Map<String, dynamic>> languages) async {
    _languages = languages;
    supportedLocales = _languages.keys.toList();

    WidgetsFlutterBinding.ensureInitialized();
    Locale selectedLocale =
        await LocalizationSettings.get() ?? _languages.keys.first;
    _setLocale(Locale(selectedLocale.languageCode, selectedLocale.countryCode));
  }

  static Future changeLocale(Locale locale, [BuildContext? context]) async {
    _setLocale(locale);

    await LocalizationSettings.save(
        locale.languageCode, locale.countryCode ?? '');

    if (context != null) {
      LocalizationApp.reload(context);
    }
  }

  static String translate(String key, [Map<String, String>? params]) {
    String? translation = _resolve(key, _localizedStrings);

    if (translation != null && params != null) {
      translation = _replaceParams(translation, params);
    }

    return translation ?? '{{$key}} not found';
  }

  static String t(String key, [Map<String, String>? params]) {
    return translate(key, params);
  }

  static void _setLocale(Locale locale) {
    final findLocale = _languages.entries.singleWhereOrNull((entry) {
      return entry.key.toString() == locale.toString();
    });

    if (findLocale == null) {
      throw Exception('${locale.toString()} is not supported');
    }

    _locale = locale;
    _localizedStrings = findLocale.value;
  }

  // from easy_localization
  static String? _resolve(String path, dynamic obj) {
    List<String> keys = path.split('.');

    if (keys.length > 1) {
      for (int index = 0; index <= keys.length; index++) {
        if (obj.containsKey(keys[index]) && obj[keys[index]] is! String) {
          return _resolve(
              keys.sublist(index + 1, keys.length).join('.'), obj[keys[index]]);
        }

        return obj[path];
      }
    }

    return obj[path];
  }

  // from flutter_i18n
  static String _replaceParams(
      String translation, Map<String, String> translationParams) {
    for (final String paramKey in translationParams.keys) {
      translation = translation.replaceAll(
          RegExp('{{$paramKey}}'), translationParams[paramKey]!);
    }
    return translation;
  }
}
