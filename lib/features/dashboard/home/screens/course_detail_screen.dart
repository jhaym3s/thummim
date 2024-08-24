import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:thummim/core/helpers/regex_validation.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../courses/domain/bloc/lessons_bloc.dart';
import '../domain/bloc/courses_bloc.dart';
import '../widget/module.dart';
import '../widget/module_tile.dart';
import 'webinar_detail_screen.dart';
import '../../courses/widgets/courseNumber.dart';

class CourseDetailScreen extends StatefulWidget {
  static const routeName = "courseDetailScreen";
  const CourseDetailScreen(
      {super.key,
      required this.courseId,
      required this.title,
      required this.courseIndex});
  final int courseId;
  final String title;
  final dynamic courseIndex;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {

  @override
  void initState() {
    super.initState();
    context.read<LessonsBloc>().add(GetLessonsEvent(courseId: widget.courseId));
  }
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
      body: BlocConsumer<CoursesBloc, CoursesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CoursesInitial) {
              // context
              //   .read<CoursesBloc>()
              //   .add(GetLearnedCourse(filter: ""));
            // context
            //     .read<CoursesBloc>()
            //     .add(GetCourseById(courseId: widget.courseId));
          }
          return SafeArea(
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
                        decoration: BoxDecoration(
                          color: const Color(0xffEBF4F6),
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.courseIndex["image"],
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.dx, vertical: 24.dy),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(6),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: kWhite,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.bookmark_border,
                                        size: 20,
                                      ))),
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
                          text: widget.title,
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
                            CustomText(
                              text: "3 quizzes",
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: kFontFamily,
                              color: const Color(0xff100C08),
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
                      WebinarSpeaker(
                        image: AssetsImages.calendar,
                        name: widget.courseIndex["instructor"]["name"].toString().capitalizeFirstOfEach,
                        info: "American Board Certified",
                      ),
                      SpaceY(16.dy),
                      // const Divider(color: Color(0xffF2F2F3)),
                      // SpaceY(16.dy),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 16.dx),
                      //   child: CustomText(
                      //     text: "Course Description",
                      //     overflow: TextOverflow.ellipsis,
                      //     fontSize: 16.sp,
                      //     fontWeight: FontWeight.w700,
                      //     color: kTextColorsLight,
                      //   ),
                      // ),
                      // SpaceY(16.dy),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: kScreenPadding.dx),
                      //   child: ExpandableText(
                      //     "Lorem ipsum dolor sit amet consectetur. Penatibus mauris dignissim lobortis nulla aliquam dolor. Mauris felis euismod sed mauris pellentesque mattis. Maecenas netus fermentum eu lectus neque gravida. Quam volutpat lacus elit sem gravida ut elementum tristique.",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodyLarge!
                      //         .copyWith(
                      //             fontSize: 14.sp,
                      //             fontWeight: FontWeight.w400,
                      //             color: kGrey),
                      //     linkTextStyle: Theme.of(context)
                      //         .textTheme
                      //         .bodyLarge!
                      //         .copyWith(
                      //             fontSize: 14.sp,
                      //             fontWeight: FontWeight.w400,
                      //             color: kPrimaryColor),
                      //     readMoreText: 'Read more',
                      //     readLessText: 'Read less',
                      //     trim:
                      //         3, // You can set the maximum number of lines to display
                      //   ),
                      // ),
                      // SpaceY(32.dy),
                      const Divider(color: Color(0xffF2F2F3)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.dx),
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
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SpaceY(16.dy),
                      BlocConsumer<LessonsBloc, LessonsState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if (state is LessonsInitial){
                             context.read<LessonsBloc>().add(GetLessonsEvent(courseId: widget.courseId));
                          }
                          if (state is GetLessonsSuccessState){
                            return Modules(lessons: state.lessons);
                          }
                          if (state is GetLessonsFailureState){
                            return CustomText(text: "Could not show curriculum now. Try again", fontSize: 16.sp, fontWeight: FontWeight.w500);
                          }
                          return  Container();
                        },
                      ),
                      SpaceY(16.dy),
                      Divider(),
                      SpaceY(16.dy),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.dx),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Ratings and Reviews ",
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: kTextColorsLight,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SpaceY(16.dy),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.dx),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "4.0",
                              overflow: TextOverflow.ellipsis,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: kTextColorsLight,
                            ),
                            SpaceX(12.dx),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFBD15),
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFBD15),
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFBD15),
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFBD15),
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffEAEAEC),
                                      size: 16,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: "88 Ratings, 50 Reviews",
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kTextColorsLight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.dx),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xffCCCDD0),
                              child: CustomText(
                                text: "Z",
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextColorsLight,
                              ),
                            ),
                            SpaceX(12.dx),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Zainab Balogun",
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kTextColorsLight,
                                ),
                                CustomText(
                                  text: "Nov 27 2018 ",
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff787D85),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFBD15),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFBD15),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFBD15),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFBD15),
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffEAEAEC),
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kScreenPadding.dx),
                        child: ExpandableText(
                          "Lorem ipsum dolor sit amet consectetur. Penatibus mauris dignissim lobortis nulla aliquam dolor. Mauris felis euismod sed mauris pellentesque mattis. Maecenas netus fermentum eu lectus neque gravida. Quam volutpat lacus elit sem gravida ut elementum tristique.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                      SpaceY(30.dy)
                    ],
                  ),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.dx),
                  child: CustomElevatedButton(
                      onPressed: () {}, buttonText: "Enroll"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
