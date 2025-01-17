import 'package:flutter/material.dart';
import 'package:thummim/features/authentication/screens/create_password_screen.dart';
import 'package:thummim/features/authentication/screens/create_reset_password_screen.dart';
import 'package:thummim/features/authentication/screens/email_verification_screen.dart';
import 'package:thummim/features/authentication/screens/forget_password_screen.dart';
import 'package:thummim/features/authentication/screens/onboarding_screen.dart';
import 'package:thummim/features/authentication/screens/select_country_screen.dart';
import 'package:thummim/features/authentication/screens/sign_up_screen.dart';
import 'package:thummim/features/dashboard/profile/screens/achievement_screen.dart';
import 'package:thummim/features/dashboard/profile/screens/personal_information_screen.dart';
import 'package:thummim/features/dashboard/courses/screens/course_description_screen.dart';
import 'package:thummim/features/dashboard/home/screens/all_course_screen.dart';
import 'package:thummim/features/dashboard/home/screens/webinars_screens.dart';

import '../../../dashbord.dart';
import '../../../features/authentication/screens/forgot_password_otp_screen.dart';
import '../../../features/authentication/screens/sign_in_screen.dart';
import '../../../features/dashboard/home/screens/course_detail_screen.dart';
import '../../../features/dashboard/home/screens/webinar_detail_screen.dart';

class AppRouter {
  static Route onGenerated(RouteSettings settings) {
    //print("Route name is ${settings.name}");
    switch (settings.name) {
      case SelectCountryScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SelectCountryScreen());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
        case CreatePasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CreatePasswordScreen());
        case EmailVerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const EmailVerificationScreen());
        case SignInScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
        case ForgetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
        case ForgetPasswordOTPScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordOTPScreen());
         case CreateResetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CreateResetPasswordScreen());
         case CustomNavigationBar.routeName:
        return MaterialPageRoute(builder: (_) => const CustomNavigationBar());
        case WebinarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WebinarScreen());
        case WebinarDetailScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WebinarDetailScreen());
        case CourseDetailScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CourseDetailScreen(courseId: 1, title: "", courseIndex: [],));
        case PersonalInformationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PersonalInformationScreen());
        case OnBoardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
        case AllCoursesScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AllCoursesScreen());
        case CourseDescriptionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CourseDescriptionScreen());
        case AchievementScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AchievementScreen());
      default:
        return onError();
    }
  }
  static Route onError() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text(
                  "Error Screen",
                  style: Theme.of(_).textTheme.bodyMedium,
                ),
              ),
            ));
  }
}
