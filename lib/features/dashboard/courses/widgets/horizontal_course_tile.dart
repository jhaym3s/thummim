import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';

import '../../../../core/components/components.dart';

class HorizontalCourseTile extends StatelessWidget {
  const HorizontalCourseTile({
    super.key, required this.containerWidth, 
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
                decoration:  BoxDecoration(
                  color: const Color(0xffEBF4F6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                   padding: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff5BA3B4),
                    borderRadius: BorderRadius.circular(29)
                  ),
                  child: Row(
                    children: [
                      Image.asset(AssetsImages.flash, height: 14.dy, width: 14.dx,),
                      CustomText(
                        text: "20",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff100C08),
                      ),
                    ],
                  )),
                Container(
                  // margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  height: 32.dy, width: 32.dx,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Center(child: Icon(Icons.bookmark_border))),
              ],
            ),


              Container(
              alignment: Alignment.center,
              height: 32.dy, width: 32.dx,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(4)
              ),
              child: const Center(child: Icon(Icons.bookmark_border)))
                  ],
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
                      SpaceY(2.dy),
                      Row(
                        children: [
                          Image.asset(AssetsImages.coursePerson, height: 24.dy, width: 24.dx,),
                          CustomText(
                            text:"Akinniyi Aje",
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
              const Icon(Icons.star,color: Color(0xffFFBD15),),
              CustomText(
                text:"4.0 (651)",
                overflow: TextOverflow.ellipsis,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: kTextColorsLight,
              ),
            ],
          ),
          CustomText(
                text:amount,
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
        const Divider(color:Color(0xffF2F2F3),),
      ],
    );
  }
}



