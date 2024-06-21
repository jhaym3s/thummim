import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';

class OnBoardingTopBar1 extends StatelessWidget {
  final Function() onTap;

  const OnBoardingTopBar1({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding:  EdgeInsets.only(right: 16.dx),
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffFFFFFF)),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SpaceY(6.dy),
            Image.asset(AssetsImages.courses, height: 328.dy),
          ],
        )
      ],
    );
  }
}
