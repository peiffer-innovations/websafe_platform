import 'package:flutter_test/flutter_test.dart';

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
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());
    });

    test('ios', () {
      WebsafePlatform.override(_MockWebsafePlatform(ios: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(true, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());
    });

    test('web', () {
      WebsafePlatform.override(_MockWebsafePlatform(web: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(true, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());
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
