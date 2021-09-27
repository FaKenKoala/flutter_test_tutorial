import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_test_tutorial/main.dart' as app;

void main() {
  //  enableFlutterDriverExtension();

  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  testWidgets('verify text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    app.main();

    // Trace the timeline of the following operation. The timeline result will
    // be written to `build/integration_response_data.json` with the key
    // `timeline`.
    await binding.traceAction(() async {
      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify that platform version is retrieved.
      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is Text &&
              widget.data!.startsWith('Platform: ${Platform.operatingSystem}'),
        ),
        findsOneWidget,
      );
    });
  });

  testWidgets('screenshot', (widgetTester) async {
    app.main();
    await binding.convertFlutterSurfaceToImage();

    await widgetTester.pumpAndSettle();
    await binding.takeScreenshot('screenshot-1:${DateTime.now()}');
  });
}
