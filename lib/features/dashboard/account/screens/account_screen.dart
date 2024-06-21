import 'package:flutter/material.dart';
import 'package:thummim/core/helpers/router/router.dart';
import 'package:thummim/features/dashboard/account/screens/notification_screen.dart';
import 'package:thummim/features/dashboard/account/screens/personal_information_screen.dart';
import 'package:thummim/features/dashboard/home/screens/home_screen.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import 'help_and_support.dart';
import 'language_screen.dart';
import 'password_screen.dart';
import 'payment_history_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<Map<String,dynamic>> personalInformation = [
    {"title": "Personal Information",
     "image":  AssetsImages.personalInformation,
     "targetScreen": const PersonalInformationScreen(),
    },
    {"title": "Personal Achievements",
     "image":  AssetsImages.achievements,
     "targetScreen": const PersonalInformationScreen(),
    },
   {"title": "App Languages",
     "image":  AssetsImages.language,
     "targetScreen": const LanguageScreen(),
    },
   {"title": "Payment History",
     "image":  AssetsImages.paymentHistory,
     "targetScreen": const PaymentHistory(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        title: CustomText(
            text: "My profile", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
              color: const Color(0xff787D85).withOpacity(.1),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xff761818),
                    radius: 32,
                    child: CustomText(
                        text: "T",
                        fontSize: 24.sp,
                        color: kWhite,
                        fontWeight: FontWeight.w600),
                  ),
                  SpaceX(8.dx),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Tiwanijesu Sulaiman",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: kTextColorsLight,
                        ),
                        CustomText(
                          text: "tiwasulaiman@gmail.com",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff787D85),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SpaceY(16.dy),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.dx),
                child: CustomText(
                    text: "Account Information",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kTextColorsLight,
                  ),
              ),
              SpaceY(8.dy),
              Column(
                children: personalInformation.map((e) => ProfileInfoTile(title: e["title"], image: e["image"], targetScreen: e["targetScreen"])).toList(),
              ),
              const HomeDivider(),
              SpaceY(16.dy),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.dx),
                child: CustomText(
                    text: "Account Settings",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kTextColorsLight,
                  ),
              ),
              SpaceY(8.dy),
               const ProfileInfoTile(title: "Password",image: AssetsImages.password,targetScreen: PasswordScreen()),
               const ProfileInfoTile(title: "Notifications",image: AssetsImages.blackNotification,targetScreen: NotificationScreen()),
              const HomeDivider(),
              SpaceY(16.dy),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.dx),
                child: CustomText(
                    text: "Support",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kTextColorsLight,
                  ),
              ),
              SpaceY(8.dy),
               ProfileInfoTile(title: "About Thummium",image: AssetsImages.about,targetScreen: PersonalInformationScreen()),
               ProfileInfoTile(title: "Help And Support",image: AssetsImages.support,targetScreen: HelpAndSupportScreen()),
              Container(
                alignment: Alignment.center,
                width: kScreenWidth(context), height: 70.dy,
                 color: const Color(0xff787D85).withOpacity(.1),
                 child: CustomText(
                    text: "Log Out",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffCF2A2A),
                  ),
              )
              
          ],
        ),
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({
    super.key,
    required this.title, required this.image, required this.targetScreen
  });
  final String title,image ;
  final Widget targetScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        moveFromBottomNavBarScreen(context: context, targetScreen: targetScreen);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.dx,vertical: 16.dy),
        child: Row(
          children: [
            Image.asset(image, height: 24.dy, width: 24.dx,),
            SpaceX(8.dx),
            CustomText(
              text: title,
              overflow: TextOverflow.ellipsis,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: kTextColorsLight,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: kTextColorsLight, size: 16,)
          ],
        ),
      ),
    );
  }
}
