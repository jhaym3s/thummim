import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';

import '../../../../core/components/components.dart';

class CourseNumber extends StatelessWidget {
  const CourseNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xff5BA3B4),
            borderRadius: BorderRadius.circular(29)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    SpaceX(4.dx),
            Image.asset(
              AssetsImages.flash,
              height: 14.dy,
              width: 16.dx,
            ),
            SpaceX(4.dx),
            CustomText(
              text: "20",
              overflow: TextOverflow.ellipsis,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xffEBF4F6),
            ),
            SpaceX(4.dx),
          ],
        ));
  }
}