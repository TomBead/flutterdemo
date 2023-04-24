import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugintest_method_channel.dart';

abstract class PlugintestPlatform extends PlatformInterface {
  /// Constructs a PlugintestPlatform.
  PlugintestPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlugintestPlatform _instance = MethodChannelPlugintest();

  /// The default instance of [PlugintestPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlugintest].
  static PlugintestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlugintestPlatform] when
  /// they register themselves.
  static set instance(PlugintestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
   return _instance.getPlatformVersion();
    // throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
