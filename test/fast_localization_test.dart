import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fast_localization/fast_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('runs MaterialApp', () {
    final app = LocalizationApp(title: () => 'test');
    expect(app.title(), 'test');
  });

  test('loads Localization', () async {
    SharedPreferences.setMockInitialValues({});

    final locales = {
      Locale('en'): {
        "welcome": "Hello World!",
      },
    };

    await Localization.load(locales);

    expect(Localization.translate('welcome'), 'Hello World!');
  });

  test('changes local', () async {
    SharedPreferences.setMockInitialValues({});

    final locales = {
      Locale('en'): {
        "name": "Hasan Al-Yazidi",
      },
      Locale('ar'): {
        "name": "حسن اليزيدي",
      },
    };

    await Localization.load(locales);

    final enName = Localization.translate('name');

    await Localization.changeLocale(Locale('ar'));

    final arName = Localization.translate('name');

    expect(enName, 'Hasan Al-Yazidi');
    expect(arName, 'حسن اليزيدي');
  });
}
