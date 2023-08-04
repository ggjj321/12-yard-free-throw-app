import 'package:flutter/material.dart';

import 'package:free_throw_phone/Components/webrtc_streaming.dart';

class VideoStreamingOdPage extends StatelessWidget {
  const VideoStreamingOdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebrtcStreamingToOdServer();
  }
}