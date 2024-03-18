import 'package:comic_book/common/exit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test renders circular container with close icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ExitButtonWidget(),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    final iconFinder = find.byType(Icon);

    expect(containerFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });
}
