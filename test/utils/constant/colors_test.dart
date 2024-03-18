import 'package:comic_book/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SystemColors can be instantiated with required color values', () {
    SystemColors colors = SystemColors(
      deepTeal: const Color(0xFF13747D),
      white: const Color(0xFFFFFFFF),
      black: const Color(0xFF000000),
      pink: const Color(0xFFFC354C),
      grey: const Color(0xFF555252),
      input: const Color(0xFFE3DFDF),
      yellow: const Color(0xFFFCF7C5),
      inputText: const Color(0xFF666161),
    );

    expect(colors.deepTeal, equals(const Color(0xFF13747D)));
    expect(colors.white, equals(const Color(0xFFFFFFFF)));
    expect(colors.black, equals(const Color(0xFF000000)));
    expect(colors.pink, equals(const Color(0xFFFC354C)));
    expect(colors.grey, equals(const Color(0xFF555252)));
    expect(colors.input, equals(const Color(0xFFE3DFDF)));
    expect(colors.yellow, equals(const Color(0xFFFCF7C5)));
    expect(colors.inputText, equals(const Color(0xFF666161)));
  });
}
