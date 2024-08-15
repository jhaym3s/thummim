import 'package:flutter/material.dart';
import 'package:thummim/core/helpers/router/router.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../widget/all_course_tile.dart';
import 'course_detail_screen.dart';

class AllCoursesScreen extends StatefulWidget {
  static const routeName = "allCourseScreen";
  const AllCoursesScreen({super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreen();
}

class _AllCoursesScreen extends State<AllCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "Available Course",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
        actions: [const Icon(Icons.filter_list_outlined), SpaceX(16.dx)],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
               // moveFromBottomNavBarScreen(context: context, targetScreen: const CourseDetailScreen(courseId: 176156,title: "",));
              },
              child: AllCourseTile(
                      title: 'Soft Skills Training Series I: Resilience', 
                      containerWidth: 144.dx, 
                      amount: '₦10,000', 
                      onPressed: () {},
                      ),
            );
          }),
        )
      ]),
    );
  }
}

