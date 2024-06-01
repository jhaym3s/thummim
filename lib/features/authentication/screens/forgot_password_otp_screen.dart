import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';
import 'create_reset_password_screen.dart';

class ForgetPasswordOTPScreen extends StatefulWidget {
  static const routeName = "forgetPasswordOTPScreen";
  const ForgetPasswordOTPScreen({super.key});

  @override
  State<ForgetPasswordOTPScreen> createState() => _ForgetPasswordOTPScreenState();
}

class _ForgetPasswordOTPScreenState extends State<ForgetPasswordOTPScreen> {
  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: CustomText(text: "Forgot Password ", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        bottom: true,
        top: false, left: false, right: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.dx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceY(20.dy),
                  CustomText(text: "Reset Password ", fontSize: 18.sp, fontWeight: FontWeight.w700),
                  SpaceY(4.dy),
                  CustomText(text: "Enter the OTP sent to your registered email address ", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
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
               moveToNextScreen(context: context, page: CreateResetPasswordScreen.routeName);
              }, buttonText: "Continue"),
                ],
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                moveToOldScreen(context: context);
                moveToOldScreen(context: context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomText(text: "Remember your password? ", fontSize: 14.sp, fontWeight: FontWeight.w400,color: const Color(0xff29303D),),
                CustomText(text: "Go back to Login ", fontSize: 14.sp, fontWeight: FontWeight.w600, color: kPrimaryColor,),  

                ],
              ),)),
        
          ],
        ),
      )
    );
  }
}