import 'package:comic_book/presentation/screens/reset_password_page/reset_password_page.dart';
import 'package:comic_book/presentation/widget/auth_button_widget.dart';
import 'package:comic_book/presentation/widget/generic_textfield_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../mokitos/get_injection.dart';

void main() {
  GetIt sl = GetIt.instance;

  getInjection(sl);
  testWidgets('ResetPasswordPage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ResetPasswordPage(),
        ),
      ),
    );

    expect(find.byType(ResetPasswordPage), findsOneWidget);
    expect(find.byType(GenericTextfieldWidget), findsOneWidget);
    expect(find.byType(AuthButtonWidget), findsOneWidget);

    expect(find.text("Reset Password"), findsOneWidget);
    expect(
        find.text("Enter the email to change your password"), findsOneWidget);
  });
}
