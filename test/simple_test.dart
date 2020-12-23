import 'package:flutter_test/flutter_test.dart';

import 'package:websafe_platform/websafe_platform.dart';

void main() {
  group('mock', () {
    tearDownAll(() {
      WebsafePlatform.override(null);
    });

    test('android', () {
      WebsafePlatform.override(WebsafePlatform.mock(android: true));
      var websafePlatform = WebsafePlatform();
      expect(true, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());

      expect('android', WebsafePlatform.name(websafePlatform));
    });
    test('fuchsia', () {
      WebsafePlatform.override(WebsafePlatform.mock(fuchsia: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(true, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());

      expect('fuchsia', WebsafePlatform.name(websafePlatform));
    });

    test('ios', () {
      WebsafePlatform.override(WebsafePlatform.mock(ios: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(true, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());

      expect('ios', WebsafePlatform.name(websafePlatform));
    });

    test('linux', () {
      WebsafePlatform.override(WebsafePlatform.mock(linux: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(true, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());

      expect('linux', WebsafePlatform.name(websafePlatform));
    });

    test('macos', () {
      WebsafePlatform.override(WebsafePlatform.mock(macos: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(true, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());

      expect('macos', WebsafePlatform.name(websafePlatform));
    });

    test('web', () {
      WebsafePlatform.override(WebsafePlatform.mock(web: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(true, websafePlatform.isWeb());
      expect(false, websafePlatform.isWindows());

      expect('web', WebsafePlatform.name(websafePlatform));
    });

    test('windows', () {
      WebsafePlatform.override(WebsafePlatform.mock(windows: true));
      var websafePlatform = WebsafePlatform();
      expect(false, websafePlatform.isAndroid());
      expect(false, websafePlatform.isFuchsia());
      expect(false, websafePlatform.isIOS());
      expect(false, websafePlatform.isLinux());
      expect(false, websafePlatform.isMacOS());
      expect(false, websafePlatform.isWeb());
      expect(true, websafePlatform.isWindows());

      expect('windows', WebsafePlatform.name(websafePlatform));
    });
  });
}
