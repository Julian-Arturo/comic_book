import 'package:flutter/material.dart';

// Class to manage system colors
class SystemColors {
  SystemColors({
    required this.deepTeal,
    required this.white,
    required this.black,
    required this.pink,
    required this.gray,
    required this.input,
    required this.yellow,
  });

  final Color deepTeal;
  final Color white;
  final Color black;
  final Color pink;
  final Color gray;
  final Color input;
  final Color yellow;
}

final SystemColors colors = SystemColors(
  deepTeal: const Color(0xFF13747D),
  white: const Color(0xFFFFFFFF),
  black: const Color(0xFF000000),
  pink: const Color(0xFFFC354C),
  gray: const Color(0xFF555252),
  input: const Color(0xFFE3DFDF),
  yellow: const Color(0xFFFCF7C5),
);
