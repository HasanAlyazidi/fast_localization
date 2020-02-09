# fast_localization

Fast localization solution for flutter apps using Dart's `Map`. (no `context` needed for every single localization). 

## Getting Started

Add the following to your `dependencies` in `pubspec.yaml` 

```yaml
fast_localization: <last_version>
```

## Examples

### Minimal (Out of the box `fast_localization` MaterialApp)

```dart
import 'package:flutter/material.dart';
import 'package:fast_localization/fast_localization.dart';

void main() async {
  final en = {
    "title": "Demo",
    "welcome": "Hello World!",
  };

  final ar = {
    "title": "عرض",
    "welcome": "أهلاً بالعالم!",
  };

  final locales = {
    Locale('en'): en,
    Locale('ar'): ar,
  };

  await Localization.load(locales);

  runApp(LocalizationApp(
    title: () => Localization.translate('title'),
    home: () => HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ...
    );
  }
}
```

#### When to use:
When you want the `home` and `title` of `MaterialApp` only.

`MaterialApp(title: 'App Name', home: HomeScreen());`

#### Full example:

Check out [example/fast_localization.dart](https://github.com/HasanAlyazidi/fast_localization/blob/master/example/fast_localization.dart)

### Flexible

> You need to install flutter_localizations

```dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fast_localization/fast_localization.dart';

void main() async {
  final en = {
    "title": "Demo",
    "welcome": "Hello World!",
  };

  final ar = {
    "title": "عرض",
    "welcome": "أهلاً بالعالم!",
  };

  final locales = {
    Locale('en'): en,
    Locale('ar'): ar,
  };

  await Localization.load(locales);

  runApp(LocalizationApp(
    child: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ...
    );
  }
}
```

#### When to use:
When you want to use own `MaterialApp`, `CupertinoApp`, or `WidgetsApp`.

#### Full example:

Check out [example/flexible.dart](https://github.com/HasanAlyazidi/fast_localization/blob/master/example/flexible.dart)

## TODO
- [ ] Locale fallback
- [x] Parameters support
- [x] Nested localizations
- [x] Auto save/load local
- [x] Language code only support `Locale('en')`
- [x] Language and country code support `Locale('en', 'US')`
- [x] Add tests

PRs are always welcome and appreciated!