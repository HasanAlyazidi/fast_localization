// 1. import material
import 'package:flutter/material.dart';

// 2. import fast localization
import 'package:fast_localization/fast_localization.dart';

// 3. add async to main function
void main() async {
  // 4. declare locales as you like, either as follows or import them
  final locales = {
    Locale('en'): {
      "title": "Demo",
      "welcome": "Hello World!",
    },
    Locale('ar'): {
      "title": "عرض",
      "welcome": "أهلاً بالعالم!",
    },
  };

  // 5. load fast localization
  await Localization.load(locales);

  // 6. use LocalizationApp
  runApp(LocalizationApp(
    title: () => Localization.translate(
        'title'), // MaterialApp(title) | required with home: only
    home: () => HomeScreen(), // MaterialApp(home) | required with home: only
    theme: ThemeData.light(), // MaterialApp(theme) | optional
  ));
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
                Localization.changeLocale(Locale('en'), context);
              },
            ),
            FlatButton(
              child: Text('عربي'),
              onPressed: () {
                Localization.changeLocale(Locale('ar'), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
