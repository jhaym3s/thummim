import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/regex_validation.dart';
import 'package:thummim/core/helpers/shared_preference_manager.dart';
import 'package:thummim/features/authentication/screens/create_password_screen.dart';
import 'package:thummim/features/authentication/screens/sign_in_screen.dart';
import 'package:thummim/core/configs/configs.dart';

import '../../../core/components/components.dart';
import '../../../core/components/custom_loader.dart';
import '../../../core/helpers/router/router.dart';
import '../../../core/helpers/toast_manager.dart';
import '../domain/bloc/authentication_bloc.dart';
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
  void initState() {
    super.initState();
    countryController.text =
        SharedPreferencesManager.getString(PrefKeys.selectedCountry);
  }

  List<Map<String, String>> countryMap = [
    {
      "name": "Nigeria",
      "flag": AssetsImages.nigeria,
    },
    {
      "name": "Côte d'Ivoire",
      "flag": AssetsImages.ivoryCost,
    },
    {
      "name": "Kenya",
      "flag": AssetsImages.kenya,
    },
    {
      "name": "Sierra Leone",
      "flag": AssetsImages.sierraLeone,
    },
    {
      "name": "Liberia",
      "flag": AssetsImages.liberia,
    },
    {
      "name": "Others",
      "flag": AssetsImages.otherCountries,
    },
  ];

  String selectedCountry(String country) {
    switch (country) {
      case "Nigeria":
        return AssetsImages.nigeria;
      case "Côte d'Ivoire":
        return AssetsImages.ivoryCost;
      case "Kenya":
        return AssetsImages.kenya;
      case "Sierra Leone":
        return AssetsImages.sierraLeone;
      case "Liberia":
        return AssetsImages.liberia;
      default:
        return AssetsImages.otherCountries;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            CountryPopUp(countryController: countryController,
                list: Column(
                  children: List.generate(
                      countryMap.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 20.dy),
                        child: CountryTile(countryName: countryMap[index]["name"]!, flag: countryMap[index]["flag"]!, onTap: (){
                          setState(() {
                            countryController.text = countryMap[index]["name"]!;
                            moveToOldScreen(context: context);
                          });
                        }),
                      )),
                ),), height: 350);
           // moveAndClearStack(context: context, page: CustomNavigationBar.routeName);
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
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceY(20.dy),
                    CustomText(
                        text: "Welcome to Thummim",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                    SpaceY(4.dy),
                    CustomText(
                      text:
                          "Enter the details requested below to start your creating your account ",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff787D85),
                    ),
                    SpaceY(32.dy),
                    NormalTextFormField(
                        hintText: "Enter your first name",
                        labelText: "First Name",
                        controller: firstNameController,
                        inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]'))
                          ],
                        validator: (String? value) {
                          return null;
                        }),
                    SpaceY(24.dy),
                    NormalTextFormField(
                        hintText: "Enter your last name",
                        labelText: "Last Name",
                        controller: lastNameController,
                        inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]'))
                          ],
                        validator: (String? value) {
                          return null;
                        }),
                    SpaceY(24.dy),
                    NormalTextFormField(
                        hintText: "Enter your email address",
                        labelText: "Email Address",
                        controller: emailController,
                        inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]'))
                          ],
                        validator: (String? value) {
                          return null;
                        }),
                    countryController.text == "Others"
                        ? SpaceY(24.dy)
                        : const SizedBox(),
                    countryController.text == "Others"
                        ? DropDownTextFormField(
                            hintText: "Select Country",
                            labelText: "Country Of Residence",
                            controller: countryController,
                            onTap: () {
                              showModalSheet(
                                  context: context,
                                  returnWidget: CountryPopUp(
                                    countryController: countryController,
                                    list: Column(
                                      children: List.generate(
                                          countryMap.length,
                                          (index) => Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20.dy),
                                                child: CountryTile(
                                                    countryName:
                                                        countryMap[index]
                                                            ["name"]!,
                                                    flag: countryMap[index]
                                                        ["flag"]!,
                                                    onTap: () {
                                                      setState(() {
                                                        countryController.text =
                                                            countryMap[index]
                                                                ["name"]!;
                                                        moveToOldScreen(
                                                            context: context);
                                                      });
                                                    }),
                                              )),
                                    ),
                                  ),
                                  height: 350);
                            },
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff9A9A93),
                            ),
                            validator: (String? value) {
                              return null;
                            })
                        : const SizedBox(),
                    SpaceY(24.dy),
                    NormalTextFormField(
                        hintText: "8012345679",
                        labelText: "Phone Number",
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]'))
                          ],
                        validator: (String? value) {
                          return null;
                        }),
                    countryController.text == "Kenya"
                        ? SpaceY(24.dy)
                        : const SizedBox(),
                    countryController.text == "Kenya"
                        ? NormalTextFormField(
                            hintText: "Enter your profession",
                            labelText: "Profession",
                            controller: numberController,
                            validator: (String? value) {
                              return null;
                            })
                        : const SizedBox(),
                    SpaceY(32.dy),
                    CustomElevatedButton(
                        onPressed: () {
                          SharedPreferencesManager.setString(PrefKeys.email, emailController.text);
                          SharedPreferencesManager.setString(PrefKeys.firstName, firstNameController.text);
                          SharedPreferencesManager.setString(PrefKeys.lastName, lastNameController.text);
                          SharedPreferencesManager.setString(PrefKeys.phoneNumber, numberController.text);
                          moveToNextScreen(
                              context: context,
                              page: CreatePasswordScreen.routeName);
                        },
                        buttonText: "Continue"),
                    SpaceY(8.dy),
                    GestureDetector(
                      onTap: () {
                        moveToNextScreen(
                            context: context, page: SignInScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Have an account already?",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff29303D),
                          ),
                          CustomText(
                            text: "Login",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    )
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
