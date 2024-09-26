import 'package:flutter/material.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/configs/configs.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {Key? key,
      required this.description,
      required this.image,
      required this.title})
      : super(key: key);
 
  
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 455.dy,
          decoration:  const BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsImages.onboarding),fit: BoxFit.cover)
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(image, height: 328.dy),
          ],
        )
      ],
    ),
      Padding(
          padding: EdgeInsets.only(left: 52.dx,right: 52.dx,top: 30.dy,),
          child: CustomText(text: title, fontSize: 24.sp, 
          fontWeight: FontWeight.w700, textAlign: TextAlign.center, softWrap: true,maxLines: 9,)
        ),
        Padding(
          padding:  EdgeInsets.only(left: 16.dx,right: 16.dx,bottom: 0.dy),
          child: CustomText(text: description, fontSize: 18.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),textAlign: TextAlign.center, maxLines: 9,)
        ),
      ],
    );
  }
}
