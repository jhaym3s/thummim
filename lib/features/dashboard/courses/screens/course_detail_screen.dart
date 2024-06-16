import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../home/screens/webinar_detail_screen.dart';
import '../widgets/courseNumber.dart';

class CourseDetailScreen extends StatefulWidget {
  static const routeName = "courseDetailScreen";
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "Course Details",
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
                    height: 239.dy,
                    width: 412.dx,
                    color: const Color(0xffEBF4F6),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.dx, vertical: 24.dy),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                   padding: const EdgeInsets.all(6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Center(
                                      child: Icon(Icons.bookmark_border,size: 20,))),
                              const CourseNumber(),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceY(16.dy),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.dx),
                    child: CustomText(
                      text: "Webinar on Stem Cell Therapy",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColorsLight,
                    ),
                  ),
                  SpaceY(4.dy),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.dx),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsImages.lessons,
                          height: 20.dy,
                          width: 20.dx,
                        ),
                        CustomText(
                          text: "2 Lessons ",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: kFontFamily,
                          color: const Color(0xff100C08),
                        ),
                        Image.asset(
                          AssetsImages.students,
                          height: 20.dy,
                          width: 20.dx,
                        ),
                        CustomText(
                          text: "2 Students ",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: kFontFamily,
                          color: const Color(0xff100C08),
                        ),
                        Image.asset(
                          AssetsImages.quiz,
                          height: 18.dy,
                          width: 18.dx,
                        ),
                        Expanded(
                          child: CustomText(
                            text: "3 quizzes",
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
                  const Divider(color: Color(0xffF2F2F3)),
                  SpaceY(16.dy),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.dx),
                    child: CustomText(
                      text: "Instructor",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColorsLight,
                    ),
                  ),
                  SpaceY(16.dy),
                  const WebinarSpeaker(
                    image: AssetsImages.calendar,
                    name: "Dr Wade Warren",
                    info: "American Board Certified",
                  ),
                  SpaceY(16.dy),
                  const Divider(color: Color(0xffF2F2F3)),
                  SpaceY(16.dy),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.dx),
                    child: CustomText(
                      text: "Course Description",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColorsLight,
                    ),
                  ),
                  SpaceY(16.dy),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kScreenPadding.dx),
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
                      trim:
                          3, // You can set the maximum number of lines to display
                    ),
                  ),
                  SpaceY(32.dy),
                  const Divider(color: Color(0xffF2F2F3)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.dx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Curriculum",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: kTextColorsLight,
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 20,),
                      ],
                    ),
                  ),
                  SpaceY(16.dy),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.dx),
                    //padding: EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F5F5), 
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Module 1",
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kTextColorsLight,
                                  ),
                                  CustomText(
                                    text: "1hr 21mins . 3 Topics . 1 Quiz",
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff787D85),
                                  ),
                                ],
                              ),
                             const Icon(Icons.keyboard_arrow_down, size: 24,),
                            ],
                          ),
                        ),
                        const Divider(color: kWhite,),
                        const ModuleTile(),
                        const ModuleTile(),
                        const ModuleTile(),

                      ],
                    ),
                  )
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dx),
              child:
                  CustomElevatedButton(onPressed: () {}, buttonText: "Enroll"),
            )
          ],
        ),
      ),
    );
  }
}

class ModuleTile extends StatelessWidget {
  const ModuleTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
      child: Row(
        children: [
          Image.asset(AssetsImages.lessons, height: 24.dy, width: 24.dx,),
          SpaceX(4.dx),
         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Introduction to stuff",
                overflow: TextOverflow.ellipsis,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: kTextColorsLight,
              ),
              CustomText(
                text: "10 Question",
                overflow: TextOverflow.ellipsis,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff787D85),
              ),
            ],
          ),
          const Spacer(),
          const Icon(CupertinoIcons.padlock_solid, color: Color(0xff787D85),)
        ],
      ),
    );
  }
}

