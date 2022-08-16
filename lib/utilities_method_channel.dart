import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'utilities_platform_interface.dart';

/// An implementation of [UtilitiesPlatform] that uses method channels.
class MethodChannelUtilities extends UtilitiesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('utilities');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
