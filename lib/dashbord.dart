import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:thummim/core/helpers/router/router.dart';
import 'package:thummim/features/dashboard/courses/screens/courses_screens.dart';
import 'package:thummim/features/dashboard/home/screens/home_screen.dart';
import 'package:thummim/features/dashboard/search/screens/search_screen.dart';

import '../../core/configs/configs.dart';
import 'features/dashboard/profile/screens/account_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  static const routeName = "custom_nav_bar";
  const CustomNavigationBar({Key? key}) : super(key: key);
  

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late PersistentTabController _pageController;
  

  List<Widget> _children() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const CourseScreen(),
      const AccountScreen(),
    ];
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
          item: ItemConfig(
            icon: Image.asset(AssetsImages.activeHome, height: 24.dy, width: 24.dx),
            inactiveIcon: Image.asset(AssetsImages.inactiveHome, height: 24.dy, width: 24.dx),
            title: "Home",
          ),
           onSelectedTabPressWhenNoScreensPushed: (){
           // context.read<CoursesBloc>().add(GetAllCourses());
           }
      ),
      PersistentTabConfig(
        screen: const SearchScreen(),
          item: ItemConfig(
            icon: Image.asset(AssetsImages.activeSearch, height: 24.dy, width: 24.dx),
            inactiveIcon: Image.asset(AssetsImages.inactiveSearch, height: 24.dy, width: 24.dx),
            title: "Search",
          ),
      ),
      PersistentTabConfig(
        screen: const CourseScreen(),
          item: ItemConfig(
            icon: Image.asset(AssetsImages.activeCourse, height: 24.dy, width: 24.dx),
            inactiveIcon: Image.asset(AssetsImages.inactiveCourse, height: 24.dy, width: 24.dx),
            title: "Courses",
          ),
      ),
      PersistentTabConfig(
        screen: const AccountScreen(),
          item: ItemConfig(
            icon: Image.asset(AssetsImages.activeAccount, height: 24.dy, width: 24.dx),
            inactiveIcon: Image.asset(AssetsImages.inactiveAccount, height: 24.dy, width: 24.dx),
            title: "Account",
          ),
         
      ),
    ];
  }

  late List<Map<Object, Object>> pages;

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pageController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _navBarsItems(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
    );
  }
}