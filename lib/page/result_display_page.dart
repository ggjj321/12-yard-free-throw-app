import 'package:flutter/material.dart';

import 'package:free_throw_phone/Components/wave_app_bar.dart';
import 'package:free_throw_phone/Components/tweleve_grid_container.dart';
import 'package:free_throw_phone/Components/gradient_render.dart';
import 'package:free_throw_phone/Components/result_text_block.dart';

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
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 750),
                childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Where your ball shoot at',
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..shader = getLinearGradient(
                            Colors.purple, Colors.blue, 0, 350),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  TwelveGridContainer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    gridMode: "displayMode",
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  ResultTextBlock(
                    screenHeight: screenHeight * 0.13,
                    screenWidth: screenWidth * 0.9,
                    project: "Hit Rate",
                    result: "100%",
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  ResultTextBlock(
                    screenHeight: screenHeight * 0.13,
                    screenWidth: screenWidth * 0.9,
                    project: "Offset Of The Supporting Leg",
                    result: "No Need",
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  ResultTextBlock(
                    screenHeight: screenHeight * 0.13,
                    screenWidth: screenWidth * 0.9,
                    project: "Offset Of Shoot Point",
                    result: "No need",
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}