import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_gallery_downloader/image_gallery_downloader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await ImageGalleryDownloader.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Image(
                  height: 200,
                  width: 200,
                  image: NetworkImage(
                      'https://appreni-public.s3.us-east-2.amazonaws.com/img-default-appreni.png')),
              ElevatedButton(
                child: const Text('Descargar'),
                onPressed: () => {
                  ImageGalleryDownloader.downloadFileFromUrl(
                      'https://appreni-public.s3.us-east-2.amazonaws.com/img-default-appreni.png')
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
