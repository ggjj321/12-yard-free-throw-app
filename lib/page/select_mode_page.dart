import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import 'package:free_throw_phone/page/data_reading_page.dart';
import 'package:free_throw_phone/page/video_streaming_od_page.dart';
import 'package:free_throw_phone/page/result_display_page.dart';

import 'package:free_throw_phone/Components/wave_app_bar.dart';
import 'package:free_throw_phone/Components/gradient_render.dart';
import 'package:free_throw_phone/Components/tweleve_grid_container.dart';

import 'package:free_throw_phone/provider/total_shoot_time_provider.dart';

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
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  gridMode: "selectMode",
                ),
                SizedBox(height: screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(
                        Icons.remove,
                      ),
                      tooltip: 'Decrease',
                      onPressed: () =>
                          Provider.of<TotalShootTime>(context, listen: false)
                              .decreaseTime(),
                    ),
                    Consumer<TotalShootTime>(
                      builder: (context, totalShootTimeProvider, child) {
                        return Text(
                          '${totalShootTimeProvider.totalShoottime}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            foreground: Paint()
                              ..shader = getLinearGradient(
                                  Colors.blue, Colors.purple, 0, 300),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.add),
                      tooltip: 'Add',
                      onPressed: () =>
                          Provider.of<TotalShootTime>(context, listen: false)
                              .addTime(),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultDisplayPage()),
                  ),
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
