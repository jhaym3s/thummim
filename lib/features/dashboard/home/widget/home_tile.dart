import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';

import '../../../../core/components/components.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
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
    return Container(
      margin: EdgeInsets.only(right: 16.dx,),
      height: 284.dy, width: containerWidth,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffE0DFDF),)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180.dy, width: containerWidth,
           decoration:   const BoxDecoration(
          color:  Color(0xffEBF4F6),
          borderRadius:  BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        ),
        child:  
           Align(
            alignment: Alignment.topRight,
            child: Container(
               margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 32.dy, width: 32.dx,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(4)
              ),
              child: const Center(child: Icon(Icons.bookmark_border)))),
            ),
    SpaceY(16.dy),
    Padding(
    padding:  EdgeInsets.symmetric(horizontal: 10.dx),
    child: CustomText(
      text: title ,
      overflow: TextOverflow.ellipsis,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xff100C08),
    ),
     ),
   Padding(
    padding:  EdgeInsets.symmetric(horizontal: 10.dx),
    child: Row(
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
      ),
    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.dx),
      child: Row(
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
    ),
          ],
        ),
    );
  }
}




class WebinarTile extends StatelessWidget {
  const WebinarTile({
    super.key, required this.containerWidth, 
    required this.title, 
  });
  final double containerWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.dx,),
      height: 284.dy, width: containerWidth,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffE0DFDF),)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180.dy, width: containerWidth,
           decoration:   const BoxDecoration(
          color:  Color(0xffEBF4F6),
          borderRadius:  BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        ),
        child:  
           Align(
            alignment: Alignment.topRight,
            child: Container(
               margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 32.dy, width: 32.dx,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(4)
              ),
              child: const Center(child: Icon(Icons.bookmark_border)))),
   
            ),
    SpaceY(16.dy),
    Padding(
    padding:  EdgeInsets.symmetric(horizontal: 10.dx),
    child: CustomText(
      text: "25th November, 2020 . 5:30Pm" ,
      overflow: TextOverflow.ellipsis,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xff100C08),
    ),
     ),
     SpaceY(2.dy),
    Padding(
    padding:  EdgeInsets.symmetric(horizontal: 10.dx),
    child: CustomText(
      text: title ,
      overflow: TextOverflow.ellipsis,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: const Color(0xff100C08),
    ),
     ),
     SpaceY(2.dy),
   Padding(
    padding:  EdgeInsets.symmetric(horizontal: 10.dx),
    child: Row(
      children: [
         CustomText(
            text:"2 Speakers . 45 attendees ",
            overflow: TextOverflow.ellipsis,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: kFontFamily,
            color: const Color(0xff100C08),
          ),
        Image.asset(AssetsImages.webinarType, height: 18.dy, width: 18.dx,),
        Expanded(
          child: CustomText(
            text:"Akinniyi Aje",
            overflow: TextOverflow.ellipsis,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontFamily: kFontFamily,
            color: const Color(0xff100C08),
          ),
        ),
      ],
    ),
      ),
   
          ],
        ),
    );
  }
}