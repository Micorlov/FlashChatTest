import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flash_chat/main.dart' as app;



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


      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpAndSettle();

      await tester.pumpAndSettle();

      await tester.pump(Duration(seconds: 5));

      const LogIn = Key('LogIn');

      expect(find.byKey(LogIn), LogIn);

      print('---> done login test');

    });
  });
}

