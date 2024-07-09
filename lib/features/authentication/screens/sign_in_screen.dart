import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thummim/core/helpers/regex_validation.dart';
import 'package:thummim/dashbord.dart';
import 'package:thummim/features/authentication/screens/forget_password_screen.dart';
import 'package:thummim/features/authentication/screens/select_country_screen.dart';

import '../../../core/components/components.dart';
import '../../../core/components/custom_loader.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';
import '../../../core/helpers/toast_manager.dart';
import '../domain/bloc/authentication_bloc.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "signInScreen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kTransparent,
          title: CustomText(
              text: "Login", fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is LoginFailureState) {
          hideOverlayLoader(context);
          ToastManager.errorToast(context, message:state.errorMessage.capitalize);
          }
          if (state is LoginSuccessState) {
            hideOverlayLoader(context);
            moveAndClearStack(context: context, page: CustomNavigationBar.routeName);
          }
          },
          builder: (context, state) {
             if (state is LoginLoadingState) {
            showOverlayLoader(context);
          }
            return Form(
              key: _formKey,
              child: SafeArea(
                bottom: true,
                top: false,
                left: false,
                right: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.dx),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceY(20.dy),
                          CustomText(
                              text: "Welcome back to Thummim",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                          SpaceY(4.dy),
                          CustomText(
                            text:
                                "Enter the details requested below to login to your account",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff787D85),
                          ),
                          SpaceY(24.dy),
                          NormalTextFormField(
                              hintText: "Enter your email address",
                              labelText: "Email Address",
                              controller: _emailController,
                              validator: (String? value) {
                          if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                                return null;
                              }),
                          SpaceY(24.dy),
                          PasswordTextFormField(
                            hintText: "",
                            labelText: "Password",
                            controller: _passwordController,
                            validator: (String? value) {
                                if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                              return null;
                            },
                            hidePassword: hidePassword,
                            suffixFunction: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            onChanged: (p0) {},
                          ),
                          SpaceY(6.dy),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    moveToNextScreen(
                                        context: context,
                                        page: ForgetPasswordScreen.routeName);
                                  },
                                  child: CustomText(
                                      text: "Forgot Password?",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400))),
                          SpaceY(32.dy),
                          CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                    LoginUser(
                                        password: _passwordController.text,
                                        email: _emailController.text));
                                }
                                // moveToNextScreen(context: context, page: .routeName);
                                // moveAndClearStack(
                                //     context: context,
                                //     page: CustomNavigationBar.routeName);
                              },
                              buttonText: "Continue")
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            moveAndClearStack(
                                context: context,
                                page: SelectCountryScreen.routeName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Don’t have an account ? ",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff29303D),
                              ),
                              CustomText(
                                text: "SignUp",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
