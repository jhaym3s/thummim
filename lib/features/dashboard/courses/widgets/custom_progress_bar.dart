import 'package:flutter/material.dart';
import 'package:thummim/core/configs/dimensions.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;

  const CustomProgressBar({super.key, required this.width, required this.value, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Stack(
        children: [
          Container(
            width: width,
            height: 4.dy,
            decoration: BoxDecoration(color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(5),
            child: AnimatedContainer(
                height: 4.dy,
                width: width * ratio,
                duration: Duration(milliseconds: totalValue),
                decoration: BoxDecoration(
                    color: Color(0xff276674),
                    borderRadius: BorderRadius.circular(5))),
          ),
        ],
      )
    ]);
  }
}
