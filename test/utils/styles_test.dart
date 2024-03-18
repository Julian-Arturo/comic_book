import 'package:flutter/material.dart';
import 'package:comic_book/utils/styles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => WidgetsFlutterBinding.ensureInitialized());
  test('test_textStyle_returnsDefaultValues', () {
    TextStyle style = Styles.textStyle();
    expect(style.fontWeight, equals(FontWeight.w400));
    expect(style.fontSize, isNull);
    expect(style.color, equals(Colors.black));
    expect(style.decoration, equals(TextDecoration.none));
    expect(style.height, equals(1.0));
  });
}
