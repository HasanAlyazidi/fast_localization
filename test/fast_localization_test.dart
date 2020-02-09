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

  test('Localization.translate() aliasess', () async {
    SharedPreferences.setMockInitialValues({});

    final locales = {
      Locale('en'): {
        "info": {
          "id": "20200209",
          "name": "My name is {{name}}",
          "age": "I am {{age}} years old",
        },
      },
    };

    await Localization.load(locales);

    expect(Localization.t('info.id'), "20200209");
    expect(Localization.t('info.name', {"name": "Hasan"}), 'My name is Hasan');
    expect(Localization.t('info.age', {"age": "128"}), 'I am 128 years old');
    expect(t('info.id'), "20200209");
    expect(t('info.name', {"name": "Hasan"}), 'My name is Hasan');
    expect(t('info.age', {"age": "128"}), 'I am 128 years old');
  });
}
