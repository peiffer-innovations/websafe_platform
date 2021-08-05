This package is no longer maintained as there are better solutions "in the wild".

One recommended replacement is: https://pub.dev/packages/universal_platform

Or... a pure-Dart approach that I prefer now is something like:
```dart
// "kIsWeb" must come first to allow the tree shaker to stop and
// prevent "dart:io" from being included in web builds.
if (kIsWeb) {
  // do Web Stuff
} else if (Platform.isAndroid || Platform.isIOS) {
  // do mobile
}
```
