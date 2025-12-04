import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (String screenshotName, List<int> screenshotBytes, [Map<String, Object?>? args]) async {
        final directory = Directory('screenshots');
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }

        final file = File('${directory.path}/$screenshotName.png');
        await file.writeAsBytes(screenshotBytes, flush: true);
        return true;
      },
    );
  } catch (error, stackTrace) {
    stderr.writeln('integrationDriver failed: $error');
    stderr.writeln(stackTrace);
    rethrow;
  }
}