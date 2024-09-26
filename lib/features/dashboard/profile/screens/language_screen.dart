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
  int selectedIndex = 0;
  List languages = ["English","French", "Swahili"];
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
            padding:  EdgeInsets.symmetric(horizontal:16.dx, ),
            color: kWhite,
            height: 222.dy, width: kScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceY(16.dy),
                CustomText(
                    text: "Preferred Language",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kTextColorsLight,
                  ),
                  SpaceY(16.dy),
                ListView.builder(
                  itemCount: languages.length,
                  shrinkWrap: true ,
                  itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: LanguageTile(selectedIndex: selectedIndex, languages: languages,index: index,),
                    ),
                  );
                }),
              ],
            ),
          )
          ],
        )
        ,
      )
      ,
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.selectedIndex,
    required this.languages,
    required this.index
  });

  final int selectedIndex,index;
  final List languages;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        index==selectedIndex?const CircleAvatar(radius: 12,child: Icon(Icons.check, size: 14,),):const Icon(Icons.circle_outlined,color: kPrimaryColor,),
        SpaceX(21.dx),
        CustomText(text: languages[index], fontSize: 18.sp, fontWeight: FontWeight.w500),
      ],
    );
  }
}