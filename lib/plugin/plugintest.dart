
import 'plugintest_platform_interface.dart';

class Plugintest {
  Future<String?> getPlatformVersion() {
    return PlugintestPlatform.instance.getPlatformVersion();
  }
}
