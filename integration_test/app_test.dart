import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flash_chat/main.dart' as app;


// flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d R5CR90XZ9QZ --screenshot=c:\a\test\new



void main() {
  loginTest();
}

Future<void> loginTest() async {

  group('Login test', () {

    setUp(() {
      print('setUpAll');
    });

    tearDown(() async {
      print('tearingDown');
    });

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets(" Login test ", (tester) async {




      app.main();

      IntegrationTestWidgetsFlutterBinding.ensureInitialized();



      //await tester.pumpAndSettle();


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

    });
  });
}

