import 'package:comic_book/utils/colors.dart';
import 'package:comic_book/utils/styles.dart';
import 'package:flutter/material.dart';

class Theme {
  ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: colors.deepTeal,
    scaffoldBackgroundColor: colors.input,
    colorScheme: ColorScheme.fromSwatch(errorColor: colors.pink),
    focusColor: colors.pink,
    textTheme: TextTheme(
      bodyLarge: Styles.textStyle(
        textColor: colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      bodyMedium: Styles.textStyle(
        textColor: colors.black,
        fontSize: 16,
        height: 1.5,
      ),
      displayLarge: Styles.textStyle(
        textColor: colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      displayMedium: Styles.textStyle(
        textColor: colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      displaySmall: Styles.textStyle(
        textColor: colors.input,
        fontSize: 15,
        height: 1.5,
      ),
    ),
  );
}
