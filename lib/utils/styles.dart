import 'package:comic_book/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  // Define a method to generate TextStyles with customizable properties
  static TextStyle textStyle({
    FontWeight? fontWeight,
    double? fontSize,
    Color? textColor,
    TextDecoration? textDecoration,
    double? height,
  }) =>
      GoogleFonts.firaSans(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize,
        color: textColor ?? colors.black,
        decoration: textDecoration ?? TextDecoration.none,
        height: height ?? 1,
      );
}
