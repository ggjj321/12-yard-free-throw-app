import 'package:flutter/material.dart';
import 'package:free_throw_phone/Components/gradient_render.dart';

class ResultTextBlock extends StatelessWidget {
  const ResultTextBlock(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.project,
      required this.result});

  final double screenWidth;
  final double screenHeight;
  final String project;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$project : ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              foreground: Paint()
                ..shader =
                    getLinearGradient(Colors.purple, Colors.blue, 100, 250),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            result,
            style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..shader =
                      getLinearGradient(Colors.purple, Colors.blue, 100, 250)),
          ),
        ],
      ),
    );
  }
}
