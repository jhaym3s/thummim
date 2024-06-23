import 'package:flutter/material.dart';
import 'package:thummim/features/authentication/screens/forget_password_screen.dart';
import 'package:thummim/features/authentication/screens/select_country_screen.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "signInScreen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: CustomText(text: "Login", fontSize: 18.sp, fontWeight: FontWeight.w600),
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
                  CustomText(text: "Welcome back to Thummim", fontSize: 18.sp, fontWeight: FontWeight.w700),
                  SpaceY(4.dy),
                  CustomText(text: "Enter the details requested below to login to your account", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
                  SpaceY(24.dy),
                NormalTextFormField(hintText: "Enter your email address", labelText: "Email Address", controller: emailController, validator: (String? value){
                  return null;
                }),
                SpaceY(24.dy),
                PasswordTextFormField(hintText: "", labelText: "Password", controller: _passwordController, validator: (String? value){
                  return null;
                }, hidePassword: hidePassword, suffixFunction: (){},onChanged:(p0) {
                },), 
                SpaceY(6.dy),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap:(){
                      moveToNextScreen(context: context, page: ForgetPasswordScreen.routeName);
                    },
                    child: CustomText(text: "Forgot Password?", fontSize: 14.sp, fontWeight: FontWeight.w400))),
                SpaceY(32.dy),
               CustomElevatedButton(onPressed: (){
              // moveToNextScreen(context: context, page: .routeName);
              }, buttonText: "Continue"),
                ],
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                moveAndClearStack(context: context, page: SelectCountryScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomText(text: "Don’t have an account ? ", fontSize: 14.sp, fontWeight: FontWeight.w400,color: const Color(0xff29303D),),
                CustomText(text: "SignUp", fontSize: 14.sp, fontWeight: FontWeight.w600, color: kPrimaryColor,),  

                ],
              ),)),
        
          ],
        ),
      )
    );
  }



}




