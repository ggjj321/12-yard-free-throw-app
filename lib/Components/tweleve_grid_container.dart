import 'package:flutter/material.dart';

import 'goal_painter.dart';
import 'package:free_throw_phone/Components/gradient_render.dart';

class TwelveGridContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String gridMode;
  final Map<String, int>? gridShootData;
  final int? target;

  const TwelveGridContainer(
      {Key? key,
      required this.screenWidth,
      required this.screenHeight,
      required this.gridMode,
      this.gridShootData,
      this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.2,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: CustomPaint(
        foregroundPainter: GoalPainter.uploadMode(),
        child: ((gridMode == "displayMode") & (gridShootData != null))
            ? Column(
                children: [
                  for (int y = 0; y < 3; y++)
                    Row(
                      children: [
                        for (int x = 0; x < 4; x++)
                          Container(
                            height: screenHeight * 0.0666,
                            width: screenWidth * 0.225,
                            color: target == y * 4 + x + 1 ? const Color.fromARGB(100, 55, 1, 200) : Colors.white,
                            child:
                                (gridShootData?[(y * 4 + x + 1).toString()] ==
                                        0)
                                    ? const Text("")
                                    : Center(
                                        child: Text(
                                          "${gridShootData?[(y * 4 + x + 1).toString()]}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            foreground: Paint()
                                              ..shader = getLinearGradient(
                                                  Colors.purple,
                                                  Colors.blue,
                                                  100,
                                                  250),
                                          ),
                                        ),
                                      ),
                          ),
                      ],
                    ),
                ],
              )
            : Column(
                children: [
                  for (int y = 0; y < 3; y++)
                    Row(
                      children: [
                        for (int x = 0; x < 4; x++)
                          SizedBox(
                            height: screenHeight * 0.0666,
                            width: screenWidth * 0.225,
                          )
                      ],
                    ),
                ],
              ),
      ),
    );
  }
}
