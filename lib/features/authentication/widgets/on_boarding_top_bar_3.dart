import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';

class OnBoardingTopBar3 extends StatelessWidget {
  const OnBoardingTopBar3({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          //width: 375.dx,
          height: 455.dy,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffAB3882),
                Color(0xffED2B30),
                Color(0xffF79420),
              ],
            ),
          ),
        ),
      Image.asset(AssetsImages.courses,height: 328.dy)
      ],
    );
  }
}
