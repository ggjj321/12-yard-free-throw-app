import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:free_throw_phone/Components/wave_app_bar.dart';

import 'package:free_throw_phone/Components/gradient_render.dart';
import 'package:free_throw_phone/Components/tweleve_grid_container.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: waveAppbar("Select Mode Page"),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 750),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                SizedBox(height: screenHeight * 0.07),
                Text(
                  textAlign: TextAlign.center,
                  'Choose field',
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..shader =
                          getLinearGradient(Colors.purple, Colors.blue, 0, 350),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TwelveGridContainer(
                    screenWidth: screenWidth, screenHeight: screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
