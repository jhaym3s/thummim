import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';
import '../widgets/password_requirement.dart';
import 'email_verification_screen.dart';
import 'sign_in_screen.dart';

class CreateResetPasswordScreen extends StatefulWidget {
  static const routeName = "createResetPassword";
  const CreateResetPasswordScreen({super.key});

  @override
  State<CreateResetPasswordScreen> createState() => _CreateResetPasswordScreenState();
}

class _CreateResetPasswordScreenState extends State<CreateResetPasswordScreen> {
  final _passwordController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: CustomText(text: "Forgot Password", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceY(20.dy),
              CustomText(text: "Create a New Password", fontSize: 18.sp, fontWeight: FontWeight.w700),
              SpaceY(4.dy),
              CustomText(text: "Use the requirement stated below to create a secure password", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
              SpaceY(32.dy),
               PasswordTextFormField(hintText: "", labelText: "Password", controller: _passwordController, validator: (String? value){
                return null;
              }, hidePassword: hidePassword, suffixFunction: (){},onChanged:(p0) {
              },),
              SpaceY(32.dy),
              CustomText(text: "Your password should contain", fontSize: 14.sp, fontWeight: FontWeight.w400),
              SpaceY(8.dy),
              const PasswordRequirement(),
              SpaceY(8.dy),
              const PasswordRequirement(),
               SpaceY(8.dy),
              const PasswordRequirement(),
               SpaceY(8.dy),
              const PasswordRequirement(),
              SpaceY(32.dy),
              CustomElevatedButton(onPressed: (){
            //  moveToNextScreen(context: context, page: EmailVerificationScreen.routeName);
             moveAndClearStack(context: context, page: SignInScreen.routeName);
            }, buttonText: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
