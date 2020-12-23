import 'package:meta/meta.dart' as meta;

import 'platform/mock_platform.dart';

// ignore: uri_does_not_exist
import 'platform/stub_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'platform/io_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'platform/browser_platform.dart';

class WebsafePlatform {
  factory WebsafePlatform() => _singleton;
  const WebsafePlatform._internal();

  factory WebsafePlatform.mock({
    bool android = false,
    bool fuchsia = false,
    bool ios = false,
    bool linux = false,
    bool macos = false,
    bool web = false,
    bool windows = false,
  }) =>
      MockWebsafePlatform(
        android: android,
        fuchsia: fuchsia,
        ios: ios,
        linux: linux,
        macos: macos,
        web: web,
        windows: windows,
      );

  static WebsafePlatform _singleton = WebsafePlatform._internal();

  /// Returns the strigified name of the platform.  The returned name will
  /// always be in all lower case.  In the event the current platform is one
  /// that is not currently known by the plugin, it will return `unknown`.
  static String name(
          [WebsafePlatform override = const WebsafePlatform._internal()]) =>
      override.isAndroid()
          ? 'android'
          : override.isFuchsia()
              ? 'fuchsia'
              : override.isIOS()
                  ? 'ios'
                  : override.isLinux()
                      ? 'linux'
                      : override.isMacOS()
                          ? 'macos'
                          : override.isWeb()
                              ? 'web'
                              : override.isWindows()
                                  ? 'windows'
                                  : 'unknown';

  /// Sets a global override for what platforms should return [true] or [false].
  /// This can be used for testing because most tests don't run in an Android or
  /// iOS environment.
  @meta.visibleForTesting
  static void override(WebsafePlatform platform) =>
      _singleton = platform ?? WebsafePlatform._internal();

  /// Returns whether or not the application is running on Android
  bool isAndroid() => isPlatformAndroid();

  /// Returns whether or not the application is running on Fuchsia native
  bool isFuchsia() => isPlatformFuchsia();

  /// Returns whether or not the application is running on iOS
  bool isIOS() => isPlatformIOS();

  /// Returns whether or not the application is running on Linux native
  bool isLinux() => isPlatformLinux();

  /// Returns whether or not the application is running on MacOS native
  bool isMacOS() => isPlatformMacOS();

  /// Returns whether or not the application is running on Flutter Web
  bool isWeb() => isPlatformWeb();

  /// Returns whether or not the application is running on Windows native
  bool isWindows() => isPlatformWindows();
}
