import 'package:comic_book/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class Theme {
  ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: colors.deepTeal,
    scaffoldBackgroundColor: colors.white,
    colorScheme: ColorScheme.fromSwatch(errorColor: colors.pink),
    focusColor: colors.pink,
  );
}
