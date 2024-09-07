import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/features/dashboard/courses/widgets/courseNumber.dart';

import '../../../../core/components/components.dart';

class AllCourseTile extends StatelessWidget {
  const AllCourseTile({
    super.key,
    required this.containerWidth,
    required this.title,
    required this.amount,
    required this.onPressed,
    required this.image,
    required this.authorName
  });
  final double containerWidth;
  final String title, amount,image, authorName;
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
                  image: DecorationImage(image: NetworkImage(image,),fit: BoxFit.cover),
                  color: const Color(0xffEBF4F6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CourseNumber(),
                          Container(
                              // margin: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              height: 24.dy,
                              width: 24.dx,
                              decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Center(
                                  child: Icon(Icons.bookmark_border))),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.dx,vertical: 4.dy),
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              border: Border.all(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(4)),
                          child:
                               CustomText(
                                    text: "Business",
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryColor,
                                  ),)
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
                        text: title,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff100C08),
                      ),
                      SpaceY(2.dy),
                      Row(
                        children: [
                          Image.asset(
                            AssetsImages.coursePerson,
                            height: 24.dy,
                            width: 24.dx,
                          ),
                          CustomText(
                            text: authorName,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: kFontFamily,
                            color: const Color(0xff100C08),
                          ),
                        ],
                      ),
                      SpaceY(2.dy),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xffFFBD15),
                              ),
                              CustomText(
                                text: "4.0 (651)",
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: kTextColorsLight,
                              ),
                            ],
                          ),
                          CustomText(
                            text: amount,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: kTextColorsLight,
                          ),
                        ],
                      ),
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
