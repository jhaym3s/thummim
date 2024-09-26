import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../widgets/password_popup.dart';

class PasswordScreen extends StatefulWidget {
  static const routeName = "passwordScreen";
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "Password", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: Column(
        children: [
            SpaceY(16.dy),
            Container(
              height: 102.dy,
              width: kScreenWidth(context),
              color: kWhite,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.dx),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceY(16.dy),
                    CustomText(
                      text: "Password",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kTextColorsLight,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalSheet(context: context,returnWidget:  PasswordPopUp(), height: 350);  
                      },
                      child: CustomText(
                        text: "Change Password",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff378FA4),
                      ),
                    ),
                     SpaceY(16.dy),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}