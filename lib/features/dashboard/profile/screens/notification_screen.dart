import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "Notification", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: Column(
        children: [
            SpaceY(16.dy),
            Container(
              height: 412.dy,
              width: kScreenWidth(context),
              color: kWhite,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.dx,vertical: 16.dy),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Notification Settings",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kTextColorsLight,
                    ),
                    SpaceY(24.dy),
                    const NotificationSettingTile(title: "Course", description: "Receive personalized notifications about course progress, reminders and course activities",),
                    SpaceY(24.dy),
                    Divider(color: Color(0xffF2F2F3),),
                     SpaceY(24.dy),
                    const NotificationSettingTile(title: "Learning Reminders ", description: "Receive notifications that remind you to study ",),
                    SpaceY(24.dy),
                    Divider(color: Color(0xffF2F2F3),),
                     SpaceY(24.dy),
                     const NotificationSettingTile(title: "Promotions ", description: "Receive offers and promotions on Thummium",),
                  ],
                )
              ),
            )
        ],
      ),
    );
  }
}

class NotificationSettingTile extends StatelessWidget {
  const NotificationSettingTile({
    super.key, required this.description, required this.title
  });
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
        text: title,
        overflow: TextOverflow.ellipsis,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: kTextColorsLight,
                            ),
                            CustomText(
        text: description,
        //overflow: TextOverflow.ellipsis,
        softWrap: true,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: kTextColorsLight,
                            ),
          ],
        ),
      ),
      CupertinoSwitch(value: false, onChanged: (isTrue){})
      ],
    );
  }
}