import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:free_throw_phone/Components/wave_app_bar.dart';

import 'package:free_throw_phone/Components/gradient_render.dart';
import 'package:free_throw_phone/Components/tweleve_grid_container.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({Key? key}) : super(key: key);

  void doNothing() {}

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
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Random Training',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..shader = getLinearGradient(
                                  Colors.purple, Colors.blue, 0, 150),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        const IconButton(
                          iconSize: 50,
                          icon: Icon(
                            Icons.palette,
                          ),
                          tooltip: 'Choose Video',
                          onPressed: null,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Single Training',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..shader = getLinearGradient(
                                  Colors.blue, Colors.purple, 150, 300),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        const IconButton(
                          iconSize: 50,
                          icon: Icon(Icons.radio_button_checked),
                          tooltip: 'Use Camera',
                          onPressed: null,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Training Start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..shader = getLinearGradient(
                            Colors.blue, Colors.purple, 0, 300),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
