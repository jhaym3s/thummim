import 'package:flutter/material.dart';
import 'package:thummim/core/helpers/router/router.dart';

import '../../../core/components/components.dart';
import '../../../core/components/custom_outlined_button.dart';
import '../../../core/configs/configs.dart';
import '../widgets/on_boarding_item.dart';
import '../widgets/on_boarding_top_bar1.dart';
import '../widgets/on_boarding_top_bar2.dart';
import '../widgets/on_boarding_top_bar_3.dart';
import 'select_country_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  static const routeName = "/onboarding";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _rippleAnimationController;
  late PageController _pageController;
  late Animation<double> _rippleAnimation;
  int currentIndex = 0;
  static const _kDuration = Duration(milliseconds: 1000);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );
  }

  void nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  void previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  void skipFunction() {
    _pageController.animateToPage(2, duration: _kDuration, curve: _kCurve);
  }

  void onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _rippleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: const [
              OnBoardingItem(
                  title: "Accelerate your career with our range of online courses",
                  description:
                      " Thummim - Africa's best for healthcare professionals for learning new knowledge, skills, and trends.",
                  image: AssetsImages.onboarding1),
              OnBoardingItem(
                  title: "Learn smart : Enjoyable & Personalized Lessons",
                  description:
                      "Take lessons anytime, anywhere! Attempt  real-world healthcare quizzes on-the go ",
                  image: AssetsImages.onboarding2),
               OnBoardingItem(
                  title: "Meet Jèmimè, Your AI Learning Partner!",
                  description:
                      "Jèmimè is your personal AI assistant, here to guide you every step of the way on your Thummim learning journey.",
                  image: AssetsImages.onboarding3),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Indicator(positionIndex: 0, currentIndex: currentIndex),
            Indicator(positionIndex: 1, currentIndex: currentIndex),
            Indicator(positionIndex: 2, currentIndex: currentIndex)
          ],
        ),
        SpaceY(30.dy),
        //Sign up button
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: CustomElevatedButton(
              onPressed: () {
                moveAndClearStack(context: context, page: SelectCountryScreen.routeName);
              },buttonText: "Get Started"),
        ),
        SpaceY(11.dy),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: CustomOutlinedButton(
              onPressed: () {
                moveAndClearStack(context: context, page: SignInScreen.routeName);
              },buttonText: "Login", textColor: const Color(0xff010016),),
        ),
        SpaceY(50.dy),
      ]),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex;
  final int currentIndex;
  const Indicator({
    Key? key,
    required this.positionIndex,
    required this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height:8.dy,
        width:14.dx,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          color: positionIndex == currentIndex
              ? kPrimaryColor
              : Color(0xffCCCDD0),
        ),
      ),
    );
  }
}
