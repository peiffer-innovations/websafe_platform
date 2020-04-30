import 'package:meta/meta.dart';

// ignore: uri_does_not_exist
import 'platform/stub_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'platform/io_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'platform/browser_platform.dart';

class WebsafePlatform {
  factory WebsafePlatform() => _singleton;
  WebsafePlatform._internal();
  static WebsafePlatform _singleton = WebsafePlatform._internal();

  /// Sets a global override for what platforms should return [true] or [false].
  /// This can be used for testing because most tests don't run in an Android or
  /// iOS environment.
  @visibleForTesting
  static void override(WebsafePlatform platform) =>
      _singleton = platform ?? WebsafePlatform._internal();

  /// Returns whether or not the application is running on Android
  bool isAndroid() => isPlatformAndroid();

  /// Returns whether or not the application is running on iOS
  bool isIOS() => isPlatformIOS();

  /// Returns whether or not the application is running on Flutter Web
  bool isWeb() => isPlatformWeb();
}
