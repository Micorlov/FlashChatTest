import 'package:flash_chat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flash_chat/main.dart' as app;

// flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d R5CR90XZ9QZ --screenshot=c:\a\test\new

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "After inputting a text, go to the display page which contains that same text "
        "and then navigate back to the typing page where the input should be clear",
        (WidgetTester tester) async {
      await tester.pumpWidget(FlashChat());

      await tester.pump(Duration(seconds: 5));

      final LogIn = find.byKey(Key("LogIn"));

      await tester.tap(LogIn);

      await tester.pump(Duration(seconds: 5));

      final emailField = find.byKey(Key("emailField"));

      await tester.tap(emailField);

      await tester.enterText(emailField, "micorlov@gmail.com");

      await tester.pump(Duration(seconds: 5));

      expect(find.byKey(Key("emailField")), findsOneWidget);

      print('---> done login test');
    },
  );


}
