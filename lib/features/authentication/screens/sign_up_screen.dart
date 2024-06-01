import 'package:flutter/material.dart';
import 'package:thummim/features/authentication/screens/create_password_screen.dart';
import 'package:thummim/features/authentication/screens/sign_in_screen.dart';
import 'package:thummim/core/configs/configs.dart';

import '../../../core/components/components.dart';
import '../../../core/helpers/router/router.dart';
import '../widgets/country_popup.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "signUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final numberController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: CustomText(text: "Sign Up", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SpaceY(20.dy),
            CustomText(text: "Welcome to Thummim", fontSize: 18.sp, fontWeight: FontWeight.w700),
            SpaceY(4.dy),
            CustomText(text: "Enter the details requested below to start your creating your account ", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
            SpaceY(32.dy),
            NormalTextFormField(hintText: "Enter your first name", labelText: "First Name", controller: firstNameController, validator: (String? value){
              return null;
            }),
            SpaceY(24.dy),
            NormalTextFormField(hintText: "Enter your last name", labelText: "Last Name", controller: lastNameController, validator: (String? value){
              return null;
            }),
            SpaceY(24.dy),
            NormalTextFormField(hintText: "Enter your email address", labelText: "Email Address", controller: emailController, validator: (String? value){
              return null;
            }),
            SpaceY(24.dy),
            DropDownTextFormField(
              hintText: "Select Country", 
              labelText: "Country Of Residence", 
              controller: countryController, 
              onTap: (){
                showModalSheet(context: context,returnWidget:  CountryPopUp(countryController: countryController,), height: 350);
              }, 
              suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff9A9A93),),
              validator: (String? value){
                return null;
              }),
            SpaceY(24.dy),
            NormalTextFormField(hintText: "8012345679", labelText: "Phone Number", controller: numberController, 
            validator: (String? value){
              return null;
            }),
            SpaceY(32.dy),
            CustomElevatedButton(onPressed: (){
             moveToNextScreen(context: context, page: CreatePasswordScreen.routeName);
            }, buttonText: "Continue"),
            SpaceY(8.dy),
            GestureDetector(
              onTap: (){
                moveToNextScreen(context: context, page: SignInScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomText(text: "Have an account already?", fontSize: 14.sp, fontWeight: FontWeight.w400,color: const Color(0xff29303D),),
                CustomText(text: "Login", fontSize: 14.sp, fontWeight: FontWeight.w600, color: kPrimaryColor,),  
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}