import 'package:comic_book/utils/dimensions_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DimensiExtension width and height should return correct values',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          final double screenWidth = MediaQuery.of(context).size.width;
          final double screenHeight = MediaQuery.of(context).size.height;

          // Test width
          expect(context.width(), screenWidth);
          expect(context.width(0.5), screenWidth * 0.5);

          // Test height
          expect(context.height(), screenHeight);
          expect(context.height(0.5), screenHeight * 0.5);

          return Container();
        },
      ),
    ));
  });

  testWidgets(
      'DimensiExtension fromLTRB should create EdgeInsets with correct values',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          final EdgeInsets padding = context.fromLTRB(0.1, 0.2, 0.3, 0.4);

          expect(padding.left, context.width() * 0.1);
          expect(padding.top, context.height() * 0.2);
          expect(padding.right, context.width() * 0.3);
          expect(padding.bottom, context.height() * 0.4);

          return Container();
        },
      ),
    ));
  });

  testWidgets(
      'DimensiExtension symmetric should create EdgeInsets with correct values',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          final EdgeInsets padding = context.symmetric(0.1, 0.2);

          expect(padding.vertical, context.height() * 0.4);
          expect(padding.horizontal, context.width() * 0.2);

          return Container();
        },
      ),
    ));
  });
}
