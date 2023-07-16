import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'soccer_detection_method_channel.dart';

abstract class SoccerDetectionPlatform extends PlatformInterface {
  /// Constructs a SoccerDetectionPlatform.
  SoccerDetectionPlatform() : super(token: _token);

  static final Object _token = Object();

  static SoccerDetectionPlatform _instance = MethodChannelSoccerDetection();

  /// The default instance of [SoccerDetectionPlatform] to use.
  ///
  /// Defaults to [MethodChannelSoccerDetection].
  static SoccerDetectionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SoccerDetectionPlatform] when
  /// they register themselves.
  static set instance(SoccerDetectionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
