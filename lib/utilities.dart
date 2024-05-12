import 'package:flutter/services.dart';
import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';

export 'package:file_picker/file_picker.dart';
export 'package:flutter/material.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:path_provider/path_provider.dart';
export 'package:url_launcher/url_launcher.dart';

export 'components/components.dart';
export 'components/fdottedline.dart';
export 'components/percent_indicator.dart';
export 'utils/utils.dart';

Future<void> initUtilities({
  final bool safeDevice = false,
  final bool protectDataLeaking = false,
  final bool preventScreenShot = false,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(deviceOrientations);
  await GetStorage.init();
  return;
}
