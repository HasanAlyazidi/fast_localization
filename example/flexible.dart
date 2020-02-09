// 1. import material
import 'package:flutter/material.dart';

// 2. install and import flutter_localizations
import 'package:flutter_localizations/flutter_localizations.dart';

// 3. import fast localization
import 'package:fast_localization/fast_localization.dart';

// declare locales as you like. see example/fast_localization.dart for a different way
final enLocale = Locale('en');
final arLocale = Locale('ar');

// 3. add async to main function
void main() async {
  // localizations
  final locales = {
    enLocale: {
      "title": "Demo",
      "welcome": "Hello World!",
    },
    arLocale: {
      "title": "عرض",
      "welcome": "أهلاً بالعالم!",
    },
  };

  // 4. load fast localization
  await Localization.load(locales);

  // 5. use LocalizationApp
  runApp(LocalizationApp(
    child: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Localization.locale,
      supportedLocales: Localization.supportedLocales,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.translate('title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('😉', style: TextStyle(fontSize: 50)),
            Text(Localization.translate('title'),
                style: TextStyle(fontSize: 25)),
            SizedBox(height: 60),
            FlatButton(
              child: Text('English'),
              onPressed: () {
                Localization.changeLocale(enLocale, context);
              },
            ),
            FlatButton(
              child: Text('عربي'),
              onPressed: () {
                Localization.changeLocale(arLocale, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
