import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ResourcesServices{

    Future<File> getPdfFileFromAssets(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File('${(await getTemporaryDirectory()).path}/$assetPath');
    await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
    return file;
  }
}