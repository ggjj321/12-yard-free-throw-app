import 'package:flutter/material.dart';
import 'wave_clip.dart';

PreferredSizeWidget waveAppbar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight + 45),
    child: ClipPath(
      clipper: WaveClip(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
