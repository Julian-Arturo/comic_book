import 'package:comic_book/presentation/screens/login_page/login_page.dart';
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
  testWidgets('LoginPage - Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(AuthButtonWidget), findsOneWidget);
    expect(find.byType(GenericTextfieldWidget), findsWidgets);

    expect(find.text("Welcome"), findsOneWidget);
    expect(find.text("Input the existing account"), findsOneWidget);
  });
}
