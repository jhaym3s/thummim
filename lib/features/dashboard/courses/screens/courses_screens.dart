import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thummim/core/components/search_bar.dart';
import 'package:thummim/core/helpers/regex_validation.dart';
import 'package:thummim/core/helpers/router/router.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../home/widget/all_course_tile.dart';
import '../../home/screens/course_detail_screen.dart';
import '../domain/bloc/my_courses_bloc.dart';
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
  String controllerText = "in-progress";
  List<String> filter = ["in-progress", "passed", "failed"];
  @override
  void initState() {
    super.initState();
  context.read<MyCoursesBloc>().add(GetLearnedCourse(filter: filter[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "My Course", fontSize: 18.sp, fontWeight: FontWeight.w600),
        actions: [const Icon(Icons.filter_list_outlined), SpaceX(16.dx)],
      ),
      body: BlocConsumer<MyCoursesBloc, MyCoursesState>(
        listener: (context, state) {
        },
        builder: (context, state) {
           if (state is MyCoursesInitial) {
               context.read<MyCoursesBloc>().add(GetLearnedCourse(filter: filter[0]));
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Color(0xffEAEAEC),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.dx),
                  child: CustomSearchBar(
                      hintText: "Search for your courses",
                      controller: _searchController),
                ),
                SpaceY(12.dy),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.dx),
                  child: SizedBox(
                    height: 40.dy,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //padding: EdgeInsets.only(left: 16.dx),
                        itemCount: filter.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  controllerText = filter[index];
                                });
                                context.read<MyCoursesBloc>().add(GetLearnedCourse(filter: filter[index]));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.dx),
                                child: CustomTab(
                                  title: filter[index].capitalize,
                                  controllerText: controllerText.capitalize,
                                ),
                              ));
                        }),
                  ),
                ),
                if (controllerText == filter[0])
              (state is GetLearnedCoursesSuccessState)?
                  state.courses.isEmpty?
                  Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CustomText(text: "There are no courses in progress", fontSize: 16.sp, fontWeight: FontWeight.w600)
                      ],
                    ),
                  ))
                   : Expanded(
                    child: ListView.builder(
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // moveFromBottomNavBarScreen(
                          //     context: context,
                          //     targetScreen: const CourseDescriptionScreen());
                        },
                        child: InProgressCourseTile(
                          title: state.courses[index]["name"],
                          imageUrl: state.courses[index]["image"],
                          containerWidth: 144.dx,
                          onPressed: () {},
                          quizCount:state.courses[index]["course_data"]["result"]["items"]["quiz"]["total"].toString(),
                          lessonCount: state.courses[index]["course_data"]["result"]["items"]["lesson"]["total"].toString(),
                        ),
                      );
                    }),
                  ):
                  Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CustomText(text: "Courses in progress will appear here", fontSize: 16.sp, fontWeight: FontWeight.w600)
                      ],
                    ),
                  ))
                else if (controllerText == filter[1])
                (state is GetLearnedCoursesSuccessState)?
                state.courses.isEmpty?
                  Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CustomText(text: "There are no courses passed yet", fontSize: 16.sp, fontWeight: FontWeight.w600)
                      ],
                    ),
                  ))
                   :Expanded(
                    child: ListView.builder(
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // moveFromBottomNavBarScreen(
                          //     context: context,
                          //     targetScreen: const CourseDescriptionScreen());
                        },
                        child: CompletedCourseTile(
                         title: state.courses[index]["name"],
                          imageUrl: state.courses[index]["image"],
                          containerWidth: 144.dx,
                          onPressed: () {},
                          quizCount:state.courses[index]["course_data"]["result"]["items"]["quiz"]["total"].toString(),
                          lessonCount: state.courses[index]["course_data"]["result"]["items"]["lesson"]["total"].toString(),
                        ),
                      );
                    }),
                  ): Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CustomText(text: "Courses passed will appear here", fontSize: 16.sp, fontWeight: FontWeight.w600)
                      ],
                    ),
                  ))
                else
                (state is GetLearnedCoursesSuccessState)?
                state.courses.isEmpty?
                  Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CustomText(text: "There are no courses failed yet", fontSize: 16.sp, fontWeight: FontWeight.w600)
                      ],
                    ),
                  ))
                   :
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //moveFromBottomNavBarScreen(context: context, targetScreen: const CourseDetailScreen(courseId: 176156, title: "",));
                        },
                        child: SavedCourseTile(
                          title: 'Soft Skills Training Series I: Resilience',
                          containerWidth: 144.dx,
                          amount: '₦5,000',
                          onPressed: () {},
                        ),
                      );
                    }),
                  ): Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          CustomText(text: "Courses failed will appear here", fontSize: 16.sp, fontWeight: FontWeight.w600)
                      ],
                    ),
                  ))
              ]);
        },
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab(
      {super.key, required this.controllerText, required this.title});
  final String title, controllerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: title == controllerText
              ? const Color(0xffEBF4F6)
              : const Color(0xffF4F5F5),
          borderRadius: BorderRadius.circular(4)),
      child: CustomText(
        text: title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: title == controllerText
            ? const Color(0xff378FA4)
            : const Color(0xff787D85),
      ),
    );
  }
}
