import 'package:flutter/services.dart';

class ImagePickerService {
  static const MethodChannel _channel = MethodChannel('image_picker_service');

  static Future<String?> pickImage(args) async {
    try {
      print('function called');
      final String? imagePath = await _channel.invokeMethod('pickImage', args);
      return imagePath;
    } on PlatformException catch (e) {
      print("Failed to pick image: '${e.message}'.");
      return null;
    }
  }
}
