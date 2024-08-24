import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../home/screens/webinar_detail_screen.dart';
import '../../home/widget/module.dart';
import 'courses_screens.dart';

class CourseDescriptionScreen extends StatefulWidget {
  static const routeName = "courseDescriptionScreen";
  const CourseDescriptionScreen({super.key});

  @override
  State<CourseDescriptionScreen> createState() => _CourseDescriptionScreenState();
}

class _CourseDescriptionScreenState extends State<CourseDescriptionScreen> {

  String controllerText = "Modules";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "My course",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
        actions: [const Icon(Icons.filter_list_outlined), SpaceX(16.dx)],
      ),
      body: SafeArea(
        bottom: true,
        top: false,
        right: false,
        left: false,
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.dx,vertical: 16.dy),
                    decoration: const BoxDecoration(color: Color(0xff19404A)),
                    height: 130.dy,
                    width: kScreenWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Cell Skills Training Series I: Resilience", fontSize: 20.sp, fontWeight: FontWeight.w700, color: kWhite,),
                        SpaceY(6.dy),
                        Row(
                      children: [
                        Image.asset(AssetsImages.time,height: 20.dy, width: 20.dx,),
                        CustomText(text: "5 Weeks", fontSize: 14.sp, fontWeight: FontWeight.w400, color: kWhite,),
                        SpaceX(4.dx),
                        Image.asset(AssetsImages.lessons,height: 20.dy, width: 20.dx,),
                        CustomText(text: "10 Lessons", fontSize: 14.sp, fontWeight: FontWeight.w400, color: kWhite,),
                        SpaceX(4.dx),
                         Image.asset(AssetsImages.students,height: 20.dy, width: 20.dx,),
                        CustomText(text: "10 Learners", fontSize: 14.sp, fontWeight: FontWeight.w400, color: kWhite,),
                        SpaceX(4.dx),
                        Image.asset(AssetsImages.quiz,height: 20.dy, width: 20.dx,),
                        SpaceX(4.dx),
                        CustomText(text: "10 Quizzes", fontSize: 14.sp, fontWeight: FontWeight.w400,color: kWhite),
                      ],
                    ),
                    SpaceY(6.dy),
                    Row(
                        children: [
                        CustomText(text: "By", fontSize: 14.sp, fontWeight: FontWeight.w400,color: kWhite),
                        SpaceY(4.dy),
                          Image.asset(
                            AssetsImages.coursePerson,
                            height: 24.dy,
                            width: 24.dx,
                          ),
                          SpaceY(4.dy),
                          CustomText(
                            text: "Akinniyi Aje",
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: kFontFamily,
                            color: kWhite,
                          ),
                        ],
                      ),
                      ],
                    ),
                  ),
                  SpaceY(16.dy),
                  Padding(
           padding:  EdgeInsets.symmetric(horizontal: 16.dx),
           child: Row(
            children:  [
              GestureDetector(
                onTap: (){
                   setState(() {
                        controllerText = "Modules";
                      });
                },
                child: CustomTab(title: "Modules", controllerText: controllerText,)),
                 const SpaceX(8),  
                 GestureDetector(
                  onTap: (){
                    setState(() {
                        controllerText = "Description";
                      });
                  },
                  child: CustomTab(title: "Description", controllerText: controllerText,)),
                 const SpaceX(8), 
                 GestureDetector(
                  onTap: (){
                      setState(() {
                        controllerText = "More";
                      });
                  },
                  child: CustomTab(title: "More", controllerText: controllerText,)),
            ],
                   ),
         ),
                  SpaceY(16.dy),
                  const Modules(lessons: []),
                  SpaceY(16.dy),
                  const Modules(lessons: []),
                  SpaceY(30.dy),
                ],
              ),
            )),
            
          ],
        ),
      ),
    );
  }
}