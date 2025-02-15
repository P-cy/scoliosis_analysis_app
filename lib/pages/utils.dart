import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getAssetPath(String asset) async {
  try {
    final path = await getLocalPath(asset);
    await Directory(dirname(path)).create(recursive: true);

    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }

    print("Asset loaded at: $path");
    return file.path;
  } catch (e) {
    print("Error loading asset: $e");
    return '';
  }
}

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}
