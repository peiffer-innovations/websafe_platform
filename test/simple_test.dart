import 'package:test/test.dart';

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

  test('test', () {
    var websafePlatform = WebsafePlatform();
    expect(false, websafePlatform.isAndroid());
    expect(false, websafePlatform.isIOS());
    expect(false, websafePlatform.isWeb());
  });
}

class _MockWebsafePlatform implements WebsafePlatform {
  _MockWebsafePlatform({
    this.android = false,
    this.ios = false,
    this.web = false,
  });

  final bool android;
  final bool ios;
  final bool web;

  @override
  bool isAndroid() => android;

  @override
  bool isIOS() => ios;

  @override
  bool isWeb() => web;
}
