import 'package:flutter_test/flutter_test.dart';

import 'package:fast_localization/fast_localization.dart';

void main() {
  test('runs MaterialApp', () {
    final app = LocalizationApp(title: () => 'test');
    expect(app.title(), 'test');
  });
}
