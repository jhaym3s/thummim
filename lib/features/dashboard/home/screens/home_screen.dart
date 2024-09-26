import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/core/configs/dimensions.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/regex_validation.dart';
import 'package:thummim/core/helpers/router/router.dart';
import 'package:thummim/core/helpers/shared_preference_manager.dart';
import 'package:thummim/features/dashboard/home/screens/all_course_screen.dart';
import 'package:thummim/features/dashboard/home/screens/course_detail_screen.dart';
import 'package:thummim/features/dashboard/home/screens/webinar_detail_screen.dart';
import 'package:thummim/features/dashboard/home/screens/webinars_screens.dart';

import '../../profile/bloc/profile_bloc.dart';
import '../domain/bloc/courses_bloc.dart';
import '../widget/home_tile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final firstName = SharedPreferencesManager.getString(PrefKeys.firstName);
    final lastName = SharedPreferencesManager.getString(PrefKeys.lastName);
    @override
    void initState() {
      super.initState();
      context.read<CoursesBloc>().add(GetAllCourses());
      context.read<ProfileBloc>().add(GetUserProfile());
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceY(24.dy),
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is ProfileInitial) {
                    context.read<ProfileBloc>().add(GetUserProfile());
                  }
                  return 
                  (state is ProfileSuccessState)? HomeAppbar(
                    name: state.name,
                  ):const HomeAppbar(
                    name: "...",
                  );
                },
              ),
              SpaceY(24.dy),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: CustomText(
                    text: "Continue Learning ",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: Image.asset(AssetsImages.bro),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16.dx),
              //   height: 107.dy, width: kScreenWidth(context),
              //   decoration: BoxDecoration(
              //     color: const Color(0xffEBF4F6),
              //     image: DecorationImage(image: AssetImage(AssetsImages.bro),fit: BoxFit.cover)
              //   ),
              // ),
              SpaceY(24.dy),
              const HomeDivider(),
              SpaceY(16.dy),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Recommended for you",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                    GestureDetector(
                        onTap: () {
                          moveFromBottomNavBarScreen(
                              context: context,
                              targetScreen: const AllCoursesScreen());
                        },
                        child: CustomText(
                            text: "See all",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              SpaceY(24.dy),
              BlocConsumer<CoursesBloc, CoursesState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  if (state is CoursesInitial) {
                    context.read<CoursesBloc>().add(GetAllCourses());
                  }
                  if (state is GetAllCoursesSuccessState) {
                    return SizedBox(
                    height: 284.dy,
                    child: 
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 16.dx),
                        itemCount: state.courses.length<5?state.courses.length:5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              moveFromBottomNavBarScreen(context: context, targetScreen:  CourseDetailScreen(courseId: state.courses[index].id, 
                              title:state.courses[index].name, courseIndex: state.courses[index],));
                            },
                            child: CourseTile(
                              title: state.courses[index].name,
                              containerWidth: 304.dx,
                              image: state.courses[index].image,
                              authorName: state.courses[index].instructor.name,
                              amount: state.courses[index].originPriceRendered.toString(),
                              onPressed: () {},
                            ),
                          );
                        })
                  );
                  } else {
                    return Container(
                          alignment: Alignment.center,
                          child: CustomText(text: "...", fontSize: 16.sp, fontWeight: FontWeight.w500),
                        );
                  }
                },
              ),
              SpaceY(16.dy),
              const HomeDivider(),
              SpaceY(16.dy),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Upcoming webinars",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                    GestureDetector(
                        onTap: () {
                          moveFromBottomNavBarScreen(
                              context: context,
                              targetScreen: const WebinarScreen());
                        },
                        child: CustomText(
                            text: "See all",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              SpaceY(24.dy),
              SizedBox(
                height: 284.dy,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16.dx),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          moveFromBottomNavBarScreen(
                              context: context,
                              targetScreen: const WebinarDetailScreen());
                        },
                        child: WebinarTile(
                          title: 'Soft Skills Training Series I: Resilience',
                          containerWidth: 304.dx,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDivider extends StatelessWidget {
  const HomeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.dy,
      width: kScreenWidth(context),
      color: const Color(0xffF4F5F5),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.dx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: kBlack,
                radius: 20,
              ),
              SpaceX(8.dx),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Welcome",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff787D85),
                  ),
                  CustomText(
                    text: name,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff12161B),
                  )
                ],
              ),
            ],
          ),
          Image.asset(
            AssetsImages.notificationIcon,
            height: 32.dy,
            width: 32.dx,
          )
        ],
      ),
    );
  }
}
