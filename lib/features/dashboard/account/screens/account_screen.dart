import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
              SpaceY(24.dy),
              const ProfileInfoTile(title: "Personal Information",image: AssetsImages.inactiveAccount,),
              const ProfileInfoTile(title: "Personal Information",image: AssetsImages.inactiveAccount,)
          ],
        ),
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({
    super.key,
    required this.title, required this.image
  });
  final String title,image ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.dx),
      child: Row(
        children: [
          const Icon(Icons.person),
          SpaceX(8.dx),
          CustomText(
            text: title,
            overflow: TextOverflow.ellipsis,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: kTextColorsLight,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: kTextColorsLight,)
        ],
      ),
    );
  }
}
