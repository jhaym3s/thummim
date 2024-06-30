import 'package:flutter/material.dart';
import 'package:thummim/core/components/search_bar.dart';
import 'package:thummim/core/helpers/router/router.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../home/widget/all_course_tile.dart';
import '../../home/screens/course_detail_screen.dart';
import '../widgets/completed_course_tile.dart';
import '../widgets/inprogress_course_tile.dart';
import '../widgets/saved_course_tile.dart';
import 'course_description_screen.dart';

class CourseScreen extends StatefulWidget {
  static const routeName = "courseScreen";
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreen();
}

class _CourseScreen extends State<CourseScreen> {
  final _searchController = TextEditingController();
  String controllerText = "Saved";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "My Course",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
        actions: [const Icon(Icons.filter_list_outlined), SpaceX(16.dx)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Divider(color: Color(0xffEAEAEC),),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: 16.dx),
          child: CustomSearchBar(hintText: "Search for your courses", controller: _searchController),
        ),
        SpaceY(12.dy),
         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 16.dx),
           child: Row(
            children:  [
              GestureDetector(
                onTap: (){
                   setState(() {
                        controllerText = "In Progress";
                      });
                },
                child: CustomTab(title: "In Progress", controllerText: controllerText,)),
                 const SpaceX(8),  
                 GestureDetector(
                  onTap: (){
                    setState(() {
                        controllerText = "Completed";
                      });
                  },
                  child: CustomTab(title: "Completed", controllerText: controllerText,)),
                 const SpaceX(8), 
                 GestureDetector(
                  onTap: (){
                      setState(() {
                        controllerText = "Saved";
                      });
                  },
                  child: CustomTab(title: "Saved", controllerText: controllerText,)),
            ],
                   ),
         ),
         if (controllerText == "In Progress") Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                moveFromBottomNavBarScreen(context: context, targetScreen: const CourseDescriptionScreen());
              },
              child: InProgressCourseTile(
                      title: 'Soft Skills Training Series I: Resilience', 
                      containerWidth: 144.dx, 
                      amount: '₦10,000', 
                      onPressed: () {},
                      ),
            );
          }),
        ) else if (controllerText == "Completed") Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                moveFromBottomNavBarScreen(context: context, targetScreen: const CourseDescriptionScreen());
              },
              child: CompletedCourseTile(
                      title: 'Soft Skills Training Series I: Resilience', 
                      containerWidth: 144.dx, 
                      amount: '₦3,000', 
                      onPressed: () {},
                      ),
            );
          }),
        )
        else Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                moveFromBottomNavBarScreen(context: context, targetScreen: const CourseDetailScreen());
              },
              child: SavedCourseTile(
                      title: 'Soft Skills Training Series I: Resilience', 
                      containerWidth: 144.dx, 
                      amount: '₦5,000', 
                      onPressed: () {},
                      ),
            );
          }),
        )
      ]),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key, required this.controllerText, required this.title
  });
  final String title, controllerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:   BoxDecoration(
        color: title == controllerText? const Color(0xffEBF4F6):const Color(0xffF4F5F5),
        borderRadius:BorderRadius.circular(4)
      ),
      child: CustomText(text: title, fontSize: 14.sp, fontWeight: FontWeight.w500, color: title == controllerText? const Color(0xff378FA4):const Color(0xff787D85),),
    );
  }
}

