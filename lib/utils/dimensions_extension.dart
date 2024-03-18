import 'package:flutter/material.dart';

extension DimensiExtension on BuildContext {
  // Get the width of the screen or a percentage of it
  double width([num? value]) {
    if (value != null) {
      return MediaQuery.of(this).size.width * value;
    }
    return MediaQuery.of(this).size.width;
  }

  // Get the height of the screen or a percentage of it
  double height([num? value]) {
    if (value != null) {
      return MediaQuery.of(this).size.height * value;
    }
    return MediaQuery.of(this).size.height;
  }

  // Create EdgeInsets from left, top, right, and bottom percentages of the screen width
  EdgeInsets fromLTRB(num left, num top, num right, num bottom) {
    return EdgeInsets.fromLTRB(
      width() * left,
      height() * top,
      width() * right,
      height() * bottom,
    );
  }

  // Create EdgeInsets with symmetrical vertical and horizontal padding
  EdgeInsets symmetric(num horizontal, num vertical) {
    return EdgeInsets.symmetric(
      vertical: height() * vertical,
      horizontal: width() * horizontal,
    );
  }

  // Convert pixel value to responsive pixels based on screen width
  double responsivePixels(double pixel) {
    return pixel / 360 * MediaQuery.of(this).size.width;
  }

  // Create EdgeInsets with the same padding on all sides
  EdgeInsets all(num value) => EdgeInsets.all(width() * value);

  // Create EdgeInsets with horizontal padding
  EdgeInsets horizontal(num value) =>
      EdgeInsets.symmetric(horizontal: width() * value);

  // Create EdgeInsets with vertical padding
  EdgeInsets vertical(num value) =>
      EdgeInsets.symmetric(vertical: height() * value);

  // Create EdgeInsets with padding only on the top side
  EdgeInsets top(num value) => EdgeInsets.only(top: height() * value);

  // Create EdgeInsets with padding only on the left side
  EdgeInsets left(num value) => EdgeInsets.only(left: width() * value);

  // Create EdgeInsets with padding only on the right side
  EdgeInsets right(value) => EdgeInsets.only(right: width() * value);

  // Create EdgeInsets with padding only on the bottom side
  EdgeInsets bottom(value) => EdgeInsets.only(bottom: height() * value);
}
