import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/features/dashboard/courses/widgets/courseNumber.dart';
import '../../../../core/components/components.dart';
import 'custom_progress_bar.dart';

class CompletedCourseTile extends StatelessWidget {
  const CompletedCourseTile({
    super.key,
    required this.containerWidth,
    required this.title,
    required this.amount,
    required this.onPressed,
  });
  final double containerWidth;
  final String title, amount;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 88.dy,
                width: 144.dx,
                decoration: BoxDecoration(
                  color: const Color(0xffEBF4F6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           CourseNumber(),
                        ],
                      ),
                       SizedBox()
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.dx),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomText(
                      //   text: "25th November, 2020 . 5:30PM",
                      //   overflow: TextOverflow.ellipsis,
                      //   fontSize: 12.sp,
                      //   fontWeight: FontWeight.w400,
                      //   color: const Color(0xff100C08),
                      // ),
                      // SpaceY(2.dy),
                      CustomText(
                        text: "Webinar on Stem Cell Therapy",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff100C08),
                      ),
                      SpaceY(4.dy),
                      Row(
                      children: [
                        Image.asset(AssetsImages.lessons,height: 20.dy, width: 20.dx,),
                        CustomText(text: "10 Lessons", fontSize: 14.sp, fontWeight: FontWeight.w400),
                        SpaceX(4.dx),
                        //dot goes here
                        SpaceX(4.dx),
                        Image.asset(AssetsImages.quiz,height: 20.dy, width: 20.dx,),
                        SpaceX(4.dx),
                        CustomText(text: "10 Quizzes", fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ],
                    ),
                    SpaceY(8.dy),
                    CustomProgressBar(width: 214.dx, value: 100, totalValue: 100), 
                    SpaceY(3.dy),
                    CustomText(text: "50% complete ", fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: Color(0xffF2F2F3),
        ),
      ],
    );
  }
}
