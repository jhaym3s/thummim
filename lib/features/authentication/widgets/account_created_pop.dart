import 'package:flutter/material.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/components/custom_text.dart';
import 'package:thummim/core/components/search_bar.dart';
import 'package:thummim/core/helpers/router/router.dart';
import 'package:thummim/features/authentication/screens/sign_in_screen.dart';

import '../../../core/configs/configs.dart';

class AccountCreatedPop extends StatefulWidget {
  const AccountCreatedPop({
    Key? key,
    this.height = 150, required this.firstName
  }) : super(key: key);
  final double? height;
  final String firstName;
  @override
  State<AccountCreatedPop> createState() => _AccountCreatedPopState();
}
class _AccountCreatedPopState extends State<AccountCreatedPop> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kScreenHeight(context) * 1 - widget.height!.dy,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              //topRight: Radius.circular(30.0),
              //bottomRight: Radius.circular(40.0),
              //topLeft: Radius.circular(30.0),
              )
          // bottomLeft: Radius.circular(40.0)),
          ),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 24.dx, left: 19.dx, right: 19.dx),
          child: Column(
            children: [
              Image.asset(AssetsImages.celebrate,height: 100.dy, width: 100.dx,),
              SpaceY(24.dy),
              CustomText(
                        text: "Welcome aboard, ${widget.firstName}",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                        SpaceY(4.dy),
            CustomText(
                        text: "You're now officially part of the Thummim community. Get ready to elevate your healthcare knowledge and skills!",
                        fontSize: 16.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400),
                        SpaceY(24.dy),
                        CustomElevatedButton(onPressed: (){
                          moveAndClearStack(context: context, page: SignInScreen.routeName);
                        }, buttonText: "Sign In ")
            ],
          ),
        ),
      ),
    );
  }
}

