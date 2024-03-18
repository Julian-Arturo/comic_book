import 'package:comic_book/common/network_failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders NetworkFailureView widget with title and subtitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: NetworkFailureView(
            title: 'Test Title',
            subtitle: 'Test Subtitle',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(NetworkFailureView), findsOneWidget);
  });
}
