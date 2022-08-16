
import 'utilities_platform_interface.dart';

export 'package:collection/collection.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:path_provider/path_provider.dart';


class Utilities {
  Future<String?> getPlatformVersion() {
    return UtilitiesPlatform.instance.getPlatformVersion();
  }
}
