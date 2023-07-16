import 'package:flutter_test/flutter_test.dart';
import 'package:soccer_detection/soccer_detection.dart';
import 'package:soccer_detection/soccer_detection_platform_interface.dart';
import 'package:soccer_detection/soccer_detection_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSoccerDetectionPlatform
    with MockPlatformInterfaceMixin
    implements SoccerDetectionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SoccerDetectionPlatform initialPlatform = SoccerDetectionPlatform.instance;

  test('$MethodChannelSoccerDetection is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSoccerDetection>());
  });

  test('getPlatformVersion', () async {
    SoccerDetection soccerDetectionPlugin = SoccerDetection();
    MockSoccerDetectionPlatform fakePlatform = MockSoccerDetectionPlatform();
    SoccerDetectionPlatform.instance = fakePlatform;

    expect(await soccerDetectionPlugin.getPlatformVersion(), '42');
  });
}
