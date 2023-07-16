
import 'soccer_detection_platform_interface.dart';

class SoccerDetection {
  Future<String?> getPlatformVersion() {
    return SoccerDetectionPlatform.instance.getPlatformVersion();
  }
}
