import 'package:websafe_platform/websafe_platform.dart';

class MockWebsafePlatform implements WebsafePlatform {
  const MockWebsafePlatform({
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
