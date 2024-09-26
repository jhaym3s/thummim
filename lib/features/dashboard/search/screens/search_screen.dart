import 'package:flutter/material.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/components/search_bar.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/core/helpers/hive_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/configs/storage_box.dart';
import '../../home/domain/modal/courses.dart';
import '../../home/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "searchScreen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final HiveRepository _hiveRepository = HiveRepository();
  late List<Courses> courses;
  late List<String> topicDemo;

  @override
  void initState() {
    super.initState();
    courses = _hiveRepository.get(key: HiveKeys.courses, name: HiveKeys.courses);
    for (final course in courses) {
      
    }
    //final List<String> category = courses.;
  }


  final _searchController = TextEditingController();

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceY(24.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dx),
              child: CustomSearchBar(
                hintText: "Search for a course or a webinar",
                controller: _searchController,
                suffixIcon: GestureDetector(
                  child: Image.asset(
                    AssetsImages.bot,
                    height: 20.dy,
                    width: 20.dx,
                  ),
                  onTap: () {
                    _launchInBrowser("https://wa.link/x1vfzu");
                  },
                ),
              ),
            ),
            SpaceY(24.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dx),
              child: CustomText(
                  text: "Top Categories ",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            SpaceY(24.dy),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: Wrap(
                  children: topicDemo
                      .map((e) => Container(
                            padding: const EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(right: 10.dx, bottom: 10.dy),
                            decoration: BoxDecoration(
                                color: const Color(0xffF4F5F5),
                                border:
                                    Border.all(color: const Color(0xff787D85)),
                                borderRadius: BorderRadius.circular(4)),
                            child: CustomText(
                              text: e,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff787D85),
                            ),
                          ))
                      .toList(),
                )),
            SpaceY(14.dy),
            const HomeDivider(),
            SpaceY(16.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dx),
              child: CustomText(
                  text: "Recent Searches ",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),

            //  Expanded(
            //    child: Center(
            //      child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //        children: [
            //         const Icon(CupertinoIcons.search, color: Color(0xff787D85),),
            //          CustomText(text: "Your recent searches will appear here", fontSize: 14.sp, fontWeight: FontWeight.w400),
            //        ],
            //      ),
            //    ),
            //  ),
          ],
        ),
      ),
    );
  }
}
