import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class WebinarDetailScreen extends StatefulWidget {
  static const routeName = "webinarDetailScreen";
  const WebinarDetailScreen({super.key});

  @override
  State<WebinarDetailScreen> createState() => _WebinarDetailScreenState();
}

class _WebinarDetailScreenState extends State<WebinarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "Webinar Details",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
        actions: [const Icon(Icons.filter_list_outlined), SpaceX(16.dx)],
      ),
      body: SafeArea(
        bottom: true, top: false, right: false, left: false,
        child: Column(
         
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 239.dy, width: 412.dx,
                    decoration: BoxDecoration(
                        color: const Color(0xffEBF4F6),
                        image: DecorationImage(image: AssetImage(AssetsImages.webinars),fit: BoxFit.cover)
                    ),
                    
                  ),
                  SpaceY(16.dy),
                  Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.dx),
    child: CustomText(
      text: "Webinar on Stem Cell Therapy" ,
      overflow: TextOverflow.ellipsis,
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: kTextColorsLight,
    ),
     ),
     SpaceY(2.dy),
   Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.dx),
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
      SpaceY(16.dy),
       const WebinarInfo(image: AssetsImages.calendar,title: "Date", info: "25th November 2020",),
       SpaceY(16.dy),
       const WebinarInfo(image: AssetsImages.price,title: "Price", info: "Free",),
       SpaceY(16.dy),
       const WebinarInfo(image: AssetsImages.location,title: "Location", info: "Google Meet",),
       SpaceY(16.dy),
       const Divider(color:  Color(0xffF2F2F3)),
        Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.dx),
    child: CustomText(
      text: "About Webinar" ,
      overflow: TextOverflow.ellipsis,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: kTextColorsLight,
    ),
     ),
     SpaceY(16.dy),
     Padding(
                padding: EdgeInsets.symmetric(horizontal: kScreenPadding.dx),
                child: ExpandableText(
                  "Lorem ipsum dolor sit amet consectetur. Penatibus mauris dignissim lobortis nulla aliquam dolor. Mauris felis euismod sed mauris pellentesque mattis. Maecenas netus fermentum eu lectus neque gravida. Quam volutpat lacus elit sem gravida ut elementum tristique.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kGrey),
                  linkTextStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor),
                  readMoreText: 'Read more',
                  readLessText: 'Read less',
                  trim: 3, // You can set the maximum number of lines to display
                ),
              ),
       SpaceY(32.dy),
       const Divider(color:  Color(0xffF2F2F3)),
         Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.dx),
    child: CustomText(
      text: "Speaker" ,
      overflow: TextOverflow.ellipsis,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: kTextColorsLight,
    ),
     ),
     SpaceY(16.dy),
       const WebinarSpeaker(image: AssetsImages.calendar,name: "Dr Wade Warren", info: "American Board Certified",),
       SpaceY(16.dy),
       const WebinarSpeaker(image: AssetsImages.price,name: "Dr Brooklyn Simmons", info: "American Board Certified ",),
       SpaceY(24.dy),
       const Divider(color:  Color(0xffF2F2F3)),
       Padding(
         padding:  EdgeInsets.symmetric(horizontal: 16.dx),
         child: Row(
          children: [
             CustomText(
               text: "Location" ,
               overflow: TextOverflow.ellipsis,
               fontSize: 16.sp,
               fontWeight: FontWeight.w700,
               color: kTextColorsLight,
             ), 
             const Spacer(),
             CustomText(
               text: "View on Map" ,
               overflow: TextOverflow.ellipsis,
               fontSize: 12.sp,
               fontWeight: FontWeight.w400,
               color: const Color(0xff378FA4),
             ),
             const Icon(Icons.arrow_forward_ios, color: Color(0xff378FA4),size: 16,),
          ],
         ),
       ),
        SpaceY(16.dy),
        Center(child: Image.asset(AssetsImages.map, height: 191.dy, width: 380.dx,)),
        SpaceY(36.dy),
                ],
              ),
            )),








            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.dx),
              child: CustomElevatedButton(onPressed: (){}, buttonText: "Enroll"),
            )
          ],
        ),
      ),
    );
  }
}

class WebinarInfo extends StatelessWidget {
  const WebinarInfo({
    super.key,
    required this.title,
    required this.info,
    required this.image
  });

  final String title,info,image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.dx),
      child: Row(
        children: [
          Image.asset(image, height: 24.dy, width: 24.dx,),
          SpaceX(8.dx),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                              text:title,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: kFontFamily,
                              color: const Color(0xff787D85),
                      ),
               CustomText(
                               text:info,
                               overflow: TextOverflow.ellipsis,
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w600,
                               fontFamily: kFontFamily,
                               color: kTextColorsLight,
                       ),
            ],
          ),
        ],
      ),
    );
  }
}

class WebinarSpeaker extends StatelessWidget {
  const WebinarSpeaker({
    super.key,
    required this.name,
    required this.info,
    required this.image
  });

  final String name,info,image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.dx),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: kBlack,radius: 16,),
          SpaceX(8.dx),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                               text:name,
                               overflow: TextOverflow.ellipsis,
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w600,
                               fontFamily: kFontFamily,
                               color: kTextColorsLight,
                       ),
              CustomText(
                              text:info,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: kFontFamily,
                              color: const Color(0xff787D85),
                      ),
               
            ],
          ),
        ],
      ),
    );
  }
}