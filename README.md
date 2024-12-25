# The Butterfly SDK for Flutter
[![License: Apache](https://img.shields.io/badge/License-Apache-yellow.svg)](https://github.com/TheButterflySDK/Flutter/blob/main/LICENSE)
[![Platform-Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://github.com/TheButterflySDK/Flutter)
[![Platform-iOS](https://img.shields.io/badge/Platform-iOS-lightgray.svg)](https://github.com/TheButterflySDK/iOS)
[![Platform-Android](https://img.shields.io/badge/Platform-Android-green.svg)](https://github.com/TheButterflySDK/Android)
[![Platform-React-Native](https://img.shields.io/badge/Platform-ReactNative-blue.svg)](https://github.com/TheButterflySDK/React-Native)

[The Butterfly SDK](https://github.com/TheButterflyButton/About/blob/main/README.md) helps your app to take an active part in the fight against domestic violence.

## Installation
### 🔌 & ▶️

### Install via [pub.dev](https://pub.dev/packages/butterfly_sdk_flutter_plugin)

```
  butterfly_sdk_flutter_plugin: ^2.0.2
```

## Usage

To recognize your app in TheButterflySDK servers you'll need an application key. You can set it via code, as demonstrated here.

### Example in Dart

```Dart
import 'package:butterfly_sdk_flutter_plugin/butterfly_sdk_flutter_plugin.dart';

// Whenever you wish to open our screen, simply call:
ButterflySdk.openReporter(withKey: "your API key");
```

## Integration test
#### How?
You can easily verify your application key 🔑 by simply running the plugin in **DEBUG mode** 🐞.

This will cause our servers to skip the part of sending reports to real live support centers, they will only verify the API key. Eventually you'll get success / failure result.

### Enjoy and good luck ❤️
