import 'dart:io';

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

Directory currentDir = Directory.current;

class FileManager {
  List<File> fileList = [
    File('${currentDir.path}assets/images/12 (3rd copy).jpg'),
    File('${currentDir.path}assets/images/ads2.jpg'),
    File('${currentDir.path}assets/images/angry3.jpg'),
  ];
}

Future<List<File>> getImageFileFromAssets(List<String> pathList) async {
  List<File> finalLIst = [];
  pathList.forEach((path) async {
    final byteData = await rootBundle.load('assets/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    finalLIst.add(file);
  });

  return finalLIst;
}
