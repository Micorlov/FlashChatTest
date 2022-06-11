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

      // Input this text
      final inputText = 'Hello there, this is an input.';
      await tester.enterText(find.byKey(Key('your-text-field')), inputText);

      // Tap on a FAB
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // We should be in the DisplayPage that displays the inputted text

      expect(find.text(inputText), findsOneWidget);

      // Tap on the back arrow in the AppBar
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      // We should be back in the TypingPage and the previously inputted text
      // should be cleared out

      expect(find.text(inputText), findsNothing);
    },
  );


}
