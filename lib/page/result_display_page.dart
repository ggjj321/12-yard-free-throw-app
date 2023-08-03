import 'package:flutter/material.dart';
import 'package:free_throw_phone/Components/wave_app_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ResultDisplayPage extends StatelessWidget {
  const ResultDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: waveAppbar("Result Page"),
      body: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 750),
              childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
              children: []),
        ),
      ),
    );
  }
}
