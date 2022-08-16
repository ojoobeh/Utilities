
import 'utilities_platform_interface.dart';

class Utilities {
  Future<String?> getPlatformVersion() {
    return UtilitiesPlatform.instance.getPlatformVersion();
  }
}
