import 'package:flutter_test/flutter_test.dart';
import 'package:utilities/utilities.dart';
import 'package:utilities/utilities_platform_interface.dart';
import 'package:utilities/utilities_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUtilitiesPlatform 
    with MockPlatformInterfaceMixin
    implements UtilitiesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UtilitiesPlatform initialPlatform = UtilitiesPlatform.instance;

  test('$MethodChannelUtilities is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUtilities>());
  });

  test('getPlatformVersion', () async {
    Utilities utilitiesPlugin = Utilities();
    MockUtilitiesPlatform fakePlatform = MockUtilitiesPlatform();
    UtilitiesPlatform.instance = fakePlatform;
  
    expect(await utilitiesPlugin.getPlatformVersion(), '42');
  });
}
