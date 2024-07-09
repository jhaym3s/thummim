import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/regex_validation.dart';
import 'package:thummim/core/helpers/shared_preference_manager.dart';

import '../../../core/components/components.dart';
import '../../../core/components/custom_loader.dart';
import '../../../core/configs/configs.dart';
import '../../../core/helpers/router/router.dart';
import '../../../core/helpers/toast_manager.dart';
import '../domain/bloc/authentication_bloc.dart';
import '../widgets/account_created_pop.dart';
import '../widgets/password_requirement.dart';
import 'email_verification_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  static const routeName = "createPassword";
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _passwordController = TextEditingController();
  bool hidePassword = true;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8 = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final email = SharedPreferencesManager.getString(PrefKeys.email);
    final firstName = SharedPreferencesManager.getString(PrefKeys.firstName);
    final lastName = SharedPreferencesManager.getString(PrefKeys.lastName);
    final country =
        SharedPreferencesManager.getString(PrefKeys.selectedCountry);
    final phoneNumber =
        SharedPreferencesManager.getString(PrefKeys.phoneNumber);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        title: CustomText(
            text: "Sign Up", fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
         if (state is RegisterFailureState) {
          hideOverlayLoader(context);
          ToastManager.errorToast(context, message:state.errorMessage.capitalize);
          }

           if (state is RegisterSuccessState) {
            hideOverlayLoader(context);
             showModalSheet(context: context,returnWidget:  
            AccountCreatedPop(firstName: firstName,), height: 522, isDismissible: false);
          }
        },
        builder: (context, state) {
          if (state is RegisterLoadingState) {
            showOverlayLoader(context);
          }
         
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dx),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceY(20.dy),
                    CustomText(
                        text: "Create a Password",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                    SpaceY(4.dy),
                    CustomText(
                      text:
                          "Use the requirement stated below to create a secure password ",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff787D85),
                    ),
                    SpaceY(32.dy),
                    PasswordTextFormField(
                      hintText: "",
                      labelText: "Password",
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (!value.passwordValidator()) {
                          return "Password must meet all requirements below";
                        }
                        return null;
                      },
                      hidePassword: hidePassword,
                      suffixFunction: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      onChanged: (value) {
                        if (value.containsUpperCase()) {
                          setState(() {
                            containsUpperCase = true;
                          });
                        } else {
                          setState(() {
                            containsUpperCase = false;
                          });
                        }
                        if (value.containsLowerCase()) {
                          setState(() {
                            containsLowerCase = true;
                          });
                        } else {
                          setState(() {
                            containsLowerCase = false;
                          });
                        }
                        if (value.containsSpecialChars()) {
                          setState(() {
                            containsSpecialChar = true;
                          });
                        } else {
                          setState(() {
                            containsSpecialChar = false;
                          });
                        }
                        if (value.containsNumber()) {
                          setState(() {
                            containsNumber = true;
                          });
                        } else {
                          setState(() {
                            containsNumber = false;
                          });
                        }
                        if (value.length > 7) {
                          setState(() {
                            contains8 = true;
                          });
                        } else {
                          setState(() {
                            contains8 = false;
                          });
                        }
                      },
                    ),
                    SpaceY(32.dy),
                    CustomText(
                        text: "Your password should contain",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    SpaceY(8.dy),
                    PasswordRequirement(
                      requirement: "One uppercase letter e.g A",
                      isMet: containsUpperCase,
                    ),
                    SpaceY(8.dy),
                    PasswordRequirement(
                      requirement: "One lowercase letter e.g a",
                      isMet: containsLowerCase,
                    ),
                    SpaceY(8.dy),
                    PasswordRequirement(
                      requirement: "One number e.g 9",
                      isMet: containsNumber,
                    ),
                    SpaceY(8.dy),
                    PasswordRequirement(
                      requirement: "One special character e.g @",
                      isMet: containsSpecialChar,
                    ),
                    SpaceY(8.dy),
                    PasswordRequirement(
                      requirement: "Contains 8 characters",
                      isMet: contains8,
                    ),
                    SpaceY(32.dy),
                    CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(RegisterUser(
                                email: email,
                                password: _passwordController.text,
                                country: country,
                                firstName: firstName,
                                lastName: lastName,
                                phoneNumber: phoneNumber,
                                userName: email));
                            //moveToNextScreen(context: context, page: EmailVerificationScreen.routeName);
                          }
                        },
                        buttonText: "Continue"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
