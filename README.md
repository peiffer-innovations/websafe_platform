# websafe_platform

![Dart Publisher](https://github.com/peiffer-innovations/websafe_platform/workflows/Dart%20Publisher/badge.svg)

A Flutter compatible library to detect if the app is Android, iOS, or Web without requiring a hard reference on `dart:io`.  Unfortunately, `dart:io` is "infectious" in that a single import of it breaks Flutter Web's ability to complile and function.


## Using the library

Add the repo to your Flutter `pubspec.yaml` file.

```
dependencies:
  websafe_platform: <<version>> 
```

Then run...
```
flutter packages get
```


## Example

```dart
import 'package:websafe_platform/websafe_platform.dart';

...
var websafePlatform = WebsafePlatform();

var isAndroid = websafePlatform.isAndroid();
var isFuchsia = websafePlatform.isFuchsia();
var isIOS = websafePlatform.isIOS();
var isLinux = websafePlatform.isLinux();
var isMacOS = websafePlatform.isMacOS();
var isWeb = websafePlatform.isWeb();
var isWindows = websafePlatform.isWindows();

```


## Unit Testing

Because most unit tests for plugins do not run in an Android or iOS environment, this supports adding a global override to be able to simulate different platform return values.

```dart
import 'package:websafe_platform/websafe_platform.dart';

void main() {
  group('mock', () {
    tearDownAll(() {
      WebsafePlatform.override(null);
    });

    test('android', () {
      WebsafePlatform.override(_MockWebsafePlatform(android: true));
      var websafePlatform = WebsafePlatform();
      expect(true, websafePlatform.isAndroid());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isWeb());
    });

    test('ios', () {
      WebsafePlatform.override(_MockWebsafePlatform(ios: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(true, websafePlatform.isIOS());
      expect(false, websafePlatform.isWeb());
    });

    test('web', () {
      WebsafePlatform.override(_MockWebsafePlatform(web: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isIOS());
      expect(true, websafePlatform.isWeb());
    });
  });
}

class _MockWebsafePlatform implements WebsafePlatform {
  _MockWebsafePlatform({
    this.android = false,
    this.fuchsia = false,
    this.ios = false,
    this.linux = false,
    this.macos = false,
    this.web = false,
    this.windows = false,
  });

  final bool android;
  final bool fuchsia;
  final bool ios;
  final bool linux;
  final bool macos;
  final bool web;
  final bool windows;

  @override
  bool isAndroid() => android;

  @override
  bool isFuchsia() => fuchsia;

  @override
  bool isIOS() => ios;

  @override
  bool isLinux() => linux;

  @override
  bool isMacOS() => macos;

  @override
  bool isWeb() => web;

  @override
  bool isWindows() => windows;
}
```
