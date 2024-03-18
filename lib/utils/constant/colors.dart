import 'package:flutter/material.dart';

// Class to manage system colors
class SystemColors {
  SystemColors({
    required this.deepTeal,
    required this.white,
    required this.black,
    required this.pink,
    required this.grey,
    required this.input,
    required this.yellow,
    required this.inputText,
  });

  final Color deepTeal;
  final Color white;
  final Color black;
  final Color pink;
  final Color grey;
  final Color input;
  final Color yellow;
  final Color inputText;
  final Color mediumsGreen = const Color(0xFF46B757);
  final Color error = const Color(0xFFE13030);
  final Color iconFooter = const Color(0xFFC8C8C9);
  final Color inputSearch = const Color(0xFFF4F3FD);
  final Color greyLite = const Color(0xA28D8D8F);
  final Color greyBox = const Color(0xFFF3F3F3);
  final Color greyNoFound = const Color(0xFFF3F3F3);
}

SystemColors colors = lightColors;

final SystemColors lightColors = SystemColors(
  deepTeal: const Color(0xFF13747D),
  white: const Color(0xFFFFFFFF),
  black: const Color(0xFF000000),
  pink: const Color(0xFFFC354C),
  grey: const Color(0xFF555252),
  input: const Color(0xFFE3DFDF),
  yellow: const Color(0xFFFCF7C5),
  inputText: const Color(0xFF666161),
);
