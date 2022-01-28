import 'dart:async';

import 'package:flutter/services.dart';

class ImageGalleryDownloader {
  static const MethodChannel _channel =
      MethodChannel('image_gallery_downloader');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> downloadFileFromUrl(String url) async {
    await _channel.invokeMethod('downloadImageFromUrl', {'url': url});
  }
}
