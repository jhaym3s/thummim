import 'package:flutter/material.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/features/dashboard/home/widget/module_tile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/components/components.dart';

class Modules extends StatelessWidget {
  const Modules({
    super.key, required this.lessons 
  });
  final List<dynamic> lessons;

   String getLink(String htmlTag){
     String  lessonLink = "";
    final RegExp regExp = RegExp(r'(https?://\S+)');
  final Iterable<Match> matches = regExp.allMatches(htmlTag);
  if (matches.isNotEmpty) {
    for (final Match match in matches) {
      lessonLink = match.group(0)!;
      print('Link: $lessonLink');
    }
    return lessonLink;
  } else {
    print('No link s found');
    return lessonLink;
  }
}

Future<void> _launchInBrowser(String url) async {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.platformDefault,
      )) {
        throw Exception('Could not launch $url');
      }
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.dx),
      //padding: EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
      decoration: BoxDecoration(
        color: const Color(0xffF4F5F5), 
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Module 1",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kTextColorsLight,
                    ), 
                    CustomText(
                      text: "1hr 21mins . 3 Topics . 1 Quiz",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff787D85),
                    ),
                  ],
                ),
               const Icon(Icons.keyboard_arrow_down, size: 24,),
              ],
            ),
          ),
          const Divider(color: kWhite,),
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true, 
          //     physics: NeverScrollableScrollPhysics(),
          //     itemBuilder: (context,index){
          //     return ModuleTile();
          //   }),
          // )
          Column(
            children: List.generate(
                      lessons.length,
                      (index) => GestureDetector(
                        onTap: () {
                      final lessonLink = getLink(lessons[index]["post_content"]);
                        _launchInBrowser(lessonLink);
                        },
                        child: ModuleTile(title: lessons[index]["post_title"],
                        status: lessons[index]["post_status"],)),
                    ),
          ),
          
        ],
      ),
    );
  }

 
}