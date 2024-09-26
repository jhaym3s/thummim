import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thummim/core/helpers/router/router.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../domain/bloc/courses_bloc.dart';
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
  void initState() {
    super.initState();
     context.read<CoursesBloc>().add(GetAllCourses());
  }
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
        BlocConsumer<CoursesBloc, CoursesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is CoursesInitial) {
                    context.read<CoursesBloc>().add(GetAllCourses());
                  }
            return state is GetAllCoursesSuccessState?  Expanded(
              child: ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                       moveFromBottomNavBarScreen(context: context, targetScreen: CourseDetailScreen(courseId: state.courses[index].id, 
                              title:state.courses[index].name, courseIndex: state.courses[index],));
                      },
                      child: AllCourseTile(
                        image: state.courses[index].image,
                        title: state.courses[index].name,
                        authorName: state.courses[index].instructor.name,
                        containerWidth: 144.dx,
                        amount: state.courses[index].originPriceRendered.toString(),
                        onPressed: () {},
                      ),
                    );
                  }),
            ): Container(
                          alignment: Alignment.center,
                          child: CustomText(text: "...", fontSize: 16.sp, fontWeight: FontWeight.w500),
                        );
          },
        )
      ]),
    );
  }
}
