import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:butterfly_sdk_flutter_plugin/butterfly_sdk_flutter_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  static const String API_KEY = "YOUR_API_KEY";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await ButterflySdk.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  TextEditingController _deepLinkInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String imageFileName = "bf-logo.png";
    String imageRelativePath = "lib/res/img/$imageFileName";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Butterfly SDK example for Flutter'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Test deep link'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.url,
                  maxLines: 1,
                  maxLength: 1000,
                  controller: _deepLinkInputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Deep Link URL',
                  ),
                  onChanged: (text) {
                    // You can store the text in a variable if needed
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String inputText = _deepLinkInputController.text;
                  Uri.parse(inputText);
                  ButterflySdk.instance.handleDeepLinkString(
                      linkString: inputText, apiKey: API_KEY);
                },
                child: Text('Handle Deep Link'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Image(
            image: AssetImage(imageRelativePath),
          ),
          onPressed: () {
            ButterflySdk.instance
              // ..overrideLanguage(supportedLanguage: "de")
              ..open(withKey: API_KEY);
          },
        ),
      ),
    );
  }
}
