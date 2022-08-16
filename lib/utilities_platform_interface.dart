import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'utilities_method_channel.dart';

abstract class UtilitiesPlatform extends PlatformInterface {
  /// Constructs a UtilitiesPlatform.
  UtilitiesPlatform() : super(token: _token);

  static final Object _token = Object();

  static UtilitiesPlatform _instance = MethodChannelUtilities();

  /// The default instance of [UtilitiesPlatform] to use.
  ///
  /// Defaults to [MethodChannelUtilities].
  static UtilitiesPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UtilitiesPlatform] when
  /// they register themselves.
  static set instance(UtilitiesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
