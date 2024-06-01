
import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    Icon(Icons.close, color: kError,),
    SpaceX(4.dx),
    CustomText(text: "One uppercase letter e.g A", fontSize: 12.sp, fontWeight: FontWeight.w400),
      ],
    );
  }
}