import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';
import 'utilities_platform_interface.dart';

export 'package:collection/collection.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:path_provider/path_provider.dart';
export 'package:utilities/widget/image.dart';
export 'package:utilities/util/app_icons.dart';
export 'package:utilities/util/local_storage.dart';
export 'package:utilities/util/http_interceptor.dart';


class Utilities {
  Future<String?> getPlatformVersion() {
    return UtilitiesPlatform.instance.getPlatformVersion();
  }
}
