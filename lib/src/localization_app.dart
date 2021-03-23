import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fast_localization/src/localization.dart';

class LocalizationApp extends StatefulWidget {
  LocalizationApp({
    Key? key,
    this.title,
    this.theme,
    this.home,
    this.child,
  }) : super(key: key);

  final Function? title;
  final ThemeData? theme;
  final Function? home;
  final Function(BuildContext)? child;

  @override
  _LocalizationAppState createState() => _LocalizationAppState();

  static void reload(BuildContext context) {
    final _LocalizationAppState? appState =
        context.findAncestorStateOfType<_LocalizationAppState>();
    appState?.reload();
  }
}

class _LocalizationAppState extends State<LocalizationApp> {
  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return widget.child!(context);
    }

    return MaterialApp(
      theme: widget.theme,
      title: widget.title != null ? widget.title!() : '',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Localization.locale,
      supportedLocales: Localization.supportedLocales,
      home: widget.home!(),
    );
  }

  void reload() {
    setState(() {});
  }
}
