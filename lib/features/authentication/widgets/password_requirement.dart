
import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement({
    super.key, required this.requirement, required this.isMet
  });
  final String requirement;
  final bool isMet;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    Icon(isMet? Icons.check: Icons.close, color: isMet?kSuccess: kError,),
    SpaceX(4.dx),
    CustomText(text: requirement, fontSize: 12.sp, fontWeight: FontWeight.w400),
      ],
    );
  }
}