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

class HomeScreen extends StatelessWidget { ... }
```

### Flexible

```dart
```

## TODO
- [ ] Add tests
- [ ] Code factoring
- [x] Nested localizations
- [x] Auto save/load local
- [x] Language code only support `Locale('en')`
- [x] Language and country code support `Locale('en', 'US')`

PRs are always welcome and appreciated!