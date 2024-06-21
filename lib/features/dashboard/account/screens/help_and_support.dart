import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "Help and Support ", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: Column(
        children: [
          SpaceY(24.dy),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.dx,vertical: 16.dy),
            color: kWhite,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HelpAndSupportTile(title: "Visit our help section ",description: "FAQs & HELP ",image: AssetsImages.faq,),
                SpaceY(16.dy),
                const Divider(color: Color(0xffF2F2F3),),
                SpaceY(16.dy),
                 const HelpAndSupportTile(title: "Chat with us ",description: "START CHAT",image: AssetsImages.chat,),
                 SpaceY(16.dy),
                const Divider(color: Color(0xffF2F2F3),),
                SpaceY(16.dy),
                  const HelpAndSupportTile(title: "Call us  ( Mon - Sat from 9am - 5pm )",description: "+2348135796716",image: AssetsImages.call,),
                  SpaceY(16.dy),
                const Divider(color: Color(0xffF2F2F3),),
                SpaceY(16.dy),
               const HelpAndSupportTile(title: "Send us an email ",description: "EMAIL US ",image: AssetsImages.mail,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HelpAndSupportTile extends StatelessWidget {
  const HelpAndSupportTile({
    super.key,required this.description, required this.image, required this.title
  });
  final String image,title,description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image,height: 32.dy, width: 32.dx,),
        SpaceX(8.dx),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: title, fontSize: 14.sp, fontWeight: FontWeight.w400),
                CustomText(
                text: description, fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xff1F525D),),
          ],
        )
      ],
    );
  }
}