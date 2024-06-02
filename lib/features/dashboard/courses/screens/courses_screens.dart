import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../widgets/horizontal_course_tile.dart';

class CourseScreen extends StatefulWidget {
  static const routeName = "webinarScreen";
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _WebinarScreenState();
}

class _WebinarScreenState extends State<CourseScreen> {
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
            return HorizontalCourseTile(
                    title: 'Soft Skills Training Series I: Resilience', 
                    containerWidth: 144.dx, 
                    amount: '₦10,000', 
                    onPressed: () {},
                    );
          }),
        )
      ]),
    );
  }
}

class WebinarScreenTile extends StatelessWidget {
  const WebinarScreenTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 88.dy,
                width: 144.dx,
                decoration:  BoxDecoration(
                  color: const Color(0xffEBF4F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.dx),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "25th November, 2020 . 5:30PM",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff100C08),
                      ),
                      SpaceY(2.dy),
                      CustomText(
                        text: "Webinar on Stem Cell Therapy",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff100C08),
                      ),
                      SpaceY(2.dy),
                      Row(
                        children: [
                          CustomText(
                            text: "2 Speakers . 45 attendees ",
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: kFontFamily,
                            color: const Color(0xff100C08),
                          ),
                          Image.asset(
                            AssetsImages.webinarType,
                            height: 18.dy,
                            width: 18.dx,
                          ),
                          Expanded(
                            child: CustomText(
                              text: "Akinniyi Aje",
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: kFontFamily,
                              color: const Color(0xff100C08),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
