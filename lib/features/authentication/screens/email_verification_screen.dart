import 'package:flutter/material.dart';
import 'package:thummim/dashbord.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';

class EmailVerificationScreen extends StatefulWidget {
  static const routeName = "email_verification";
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: CustomText(text: "Sign Up", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceY(20.dy),
              CustomText(text: "Email Address Verification", fontSize: 18.sp, fontWeight: FontWeight.w700),
              SpaceY(4.dy),
              CustomText(text: "Enter the 6-digit verification code sent to entered phone number ", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
              SpaceY(32.dy),
              CustomPinCodeTextField(controller: _pinController, onSaved: (String value ) {  }, onSubmitted: (String value) {  }, onComplete: (String value) {  },),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomText(text: "Resend code in ", fontSize: 14.sp, fontWeight: FontWeight.w400,color: const Color(0xff29303D),),
              CustomText(text: "08:00", fontSize: 14.sp, fontWeight: FontWeight.w400, color: kPrimaryColor,),  
              ],
            ),
            SpaceY(32.dy),
             CustomElevatedButton(onPressed: (){
              moveAndClearStack(context: context, page: CustomNavigationBar.routeName);
            }, buttonText: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}