
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thummim/core/helpers/regex_validation.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class ModuleTile extends StatelessWidget {
  const ModuleTile({
    super.key, required this.title, required this.status
  });
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.dx, vertical: 16.dy),
      child: Row(
        children: [
          Image.asset(AssetsImages.lessons, height: 24.dy, width: 24.dx,),
          SpaceX(4.dx),
         Expanded(
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextColorsLight,
                ),
                CustomText(
                  text: status.capitalize,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff787D85),
                ),
              ],
            ),
         ),
          //const Spacer(),
          const Icon(CupertinoIcons.padlock_solid, color: Color(0xff787D85),)
        ],
      ),
    );
  }
}