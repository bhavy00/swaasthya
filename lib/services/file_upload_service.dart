import 'dart:async';
import 'package:flutter/services.dart';

class FileUploadService {
  static const MethodChannel _channel = MethodChannel('file_upload');

  static Future<String?> uploadFile(String filePath) async {
    try {
      final String? result = await _channel.invokeMethod('uploadFile', {'filePath': filePath});
      return result;
    } on PlatformException catch (e) {
      print("Failed to upload file: '${e.message}'.");
      return null;
    }
  }
}
