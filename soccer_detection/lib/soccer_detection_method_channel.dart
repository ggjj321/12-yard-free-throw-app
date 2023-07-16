import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'soccer_detection_platform_interface.dart';

/// An implementation of [SoccerDetectionPlatform] that uses method channels.
class MethodChannelSoccerDetection extends SoccerDetectionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('soccer_detection');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
