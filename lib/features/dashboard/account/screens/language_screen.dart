import 'package:flutter/material.dart';
import 'package:thummim/features/dashboard/home/screens/home_screen.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class LanguageScreen extends StatefulWidget {
  static const routeName = "languageScreen";
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "App Language", fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          SpaceY(24.dy),
          Container(
            padding: EdgeInsets.all(16),
            color: kWhite,
            height: 222.dy, width: kScreenWidth(context),
            child: ListView.builder(itemBuilder: (context,index){
              return Row(
                children: [
                  CircleAvatar(radius: 12,child: Icon(Icons.check),),
                  Icon(Icons.circle_outlined),
                  CustomText(
                              text: "one", fontSize: 18.sp, fontWeight: FontWeight.w500),
                ],
              );
            }),
          )
          ],
        )
        ,
      )
      ,
    );
  }
}