# The Butterfly SDK for Flutter
[![License: Apache](https://img.shields.io/badge/License-Apache-yellow.svg)](https://github.com/TheButterflySDK/Android/blob/main/LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://pub.dev/packages/butterfly_sdk_flutter_plugin)

Demonstrates how to use The Butterfly SDK  plugin.
The Butterfly SDK help your app to take an active part in the fight against domestic violent.

## Installation
### 🔌 & ▶️

### Install via pub.dev

```
  butterfly_sdk_flutter_plugin: ^2.1.3
```

## Usage

To recognize your app in TheButterflySDK servers you'll need an API key. You can set it via code, as demonstrated here.

### Examples

#### Forward deep link to the SDK after your handling

#### Open the Butterfly screen

```dart
import 'package:butterfly_sdk_flutter_plugin/butterfly_sdk_flutter_plugin.dart';

// Whenever you wish to open our screen, simply call:
ButterflySdk.instance.open(withKey: "your API key");
```

```dart
import 'package:butterfly_sdk_flutter_plugin/butterfly_sdk_flutter_plugin.dart';

// Whenever your app handle deep link, forward it to the Butterfly Button plugin
ButterflySdk.instance.handleDeepLinkString(linkString: deepLinkUrlString, apiKey: "your API key");
// OR:
ButterflySdk.instance.handleDeepLinkUri(uri: deepLinkUri, apiKey: "your API key");
```

## Integration test
### How?
You can easily verify your API key 🔑 by simply opening a chat with Betty 💬.

### Enjoy and good luck ❤️
