import 'package:flutter/material.dart';

import 'goal_painter.dart';

class TwelveGridContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String gridMode;

  const TwelveGridContainer(
      {Key? key, required this.screenWidth, required this.screenHeight, required this.gridMode})
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
        child: Column(
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
