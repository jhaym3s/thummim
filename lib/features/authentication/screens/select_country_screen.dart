import 'package:flutter/material.dart';
import 'package:thummim/features/authentication/widgets/country_popup.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/components/custom_text.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/core/helpers/router/router.dart';

import 'sign_up_screen.dart';

class SelectCountryScreen extends StatefulWidget {
  static const routeName = "select_country_screen";
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final countryController = TextEditingController();
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
              CustomText(text: "Country of Residence ", fontSize: 18.sp, fontWeight: FontWeight.w700),
              SpaceY(4.sp),
              CustomText(text: "Kindly select your country of residence. This will help us personalize your experience even better.", fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
              SpaceY(32.sp),
              DropDownTextFormField(
              hintText: "Select Country", 
              labelText: "Country Of Residence", 
              controller: countryController, 
              onTap: (){
showModalSheet(context: context,returnWidget:  CountryPopUp(countryController: countryController,
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
                ),), height: 350);              }, 
              suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff9A9A93),),
              validator: (String? value){
                return null;
              }),
              SpaceY(32.dy),
              CustomElevatedButton(onPressed: (){
                moveToNextScreen(context: context, page: SignUpScreen.routeName);
              }, buttonText: "Continue")
              
            ],
          ),
        ),
      ),
    );
  }
}