import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';
import 'forgot_password_otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "forgetPassword";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
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
                  CustomText(text: "Enter the registered email address to reset your password", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
                  SpaceY(24.dy),
                NormalTextFormField(hintText: "Enter your email address", labelText: "Email Address", controller: _emailController, validator: (String? value){
                  return null;
                }),
                SpaceY(32.dy),
               CustomElevatedButton(onPressed: (){
               moveToNextScreen(context: context, page: ForgetPasswordOTPScreen.routeName);
              }, buttonText: "Continue"),
                ],
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
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