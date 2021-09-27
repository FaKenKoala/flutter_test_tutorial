import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  integrationDriver();
  // await integrationDriver(
  //   onScreenshot: (String screenshotName, List<int> screenshotBytes) async {
  //     const directory =
  //         '/Users/wombat/FlutterProjects/flutter_test_tutorial/integration_test';
  //     final File image = File('$directory/screenshots/$screenshotName.png');
  //     image.writeAsBytesSync(screenshotBytes);
  //     return true;
  //   },
  // );
}
