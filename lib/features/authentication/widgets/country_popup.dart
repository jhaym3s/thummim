import 'package:flutter/material.dart';
import 'package:thummim/core/components/custom_text.dart';
import 'package:thummim/core/components/search_bar.dart';

import '../../../core/configs/configs.dart';

class CountryPopUp extends StatefulWidget {
  const CountryPopUp({
    Key? key,
    this.height = 150, required this.countryController, required this.list
  }) : super(key: key);
  final double? height;
  final TextEditingController countryController;
  final Widget list;
  @override
  State<CountryPopUp> createState() => _CountryPopUpState();
}

class _CountryPopUpState extends State<CountryPopUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final searchController = TextEditingController();

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
    return Container(
      height: kScreenHeight(context) * 1 - widget.height!.dy,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              //topRight: Radius.circular(30.0),
              //bottomRight: Radius.circular(40.0),
              //topLeft: Radius.circular(30.0),
              )
          // bottomLeft: Radius.circular(40.0)),
          ),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(top: 24.dx, left: 19.dx, right: 19.dx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.close,
                        color: kBlack,
                      ),
                      CustomText(
                          text: "Select Country",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                      const SizedBox()
                    ],
                  ),
                  SpaceY(24.dy),
                  CustomSearchBar(
                    hintText: "Search for your country ",
                    controller: searchController,
                  ),
                  SpaceY(24.dy),
                  widget.list
                  // CountryTile(
                  //     countryName: "Nigeria",
                  //     flag: AssetsImages.nigeria,
                  //     onTap: () {
                  //       print("hasss");
                  //       setState(() {
                  //         widget.countryController.text = "Nigeria";
                  //       });
                  //     }),
                  // SpaceY(24.dy),
                  // CountryTile(
                  //     countryName: "Côte d'Ivoire",
                  //     flag: AssetsImages.ivoryCost,
                  //     onTap: () {}),
                  // SpaceY(24.dy),
                  // CountryTile(
                  //     countryName: "Kenya",
                  //     flag: AssetsImages.kenya,
                  //     onTap: () {}),
                  // SpaceY(24.dy),
                  // CountryTile(
                  //     countryName: "Sierra Leone",
                  //     flag: AssetsImages.sierraLeone,
                  //     onTap: () {}),
                  // SpaceY(24.dy),
                  // CountryTile(
                  //     countryName: "Liberia",
                  //     flag: AssetsImages.liberia,
                  //     onTap: () {}),
                  // SpaceY(24.dy),
                  // CountryTile(
                  //   countryName: "Others",
                  //   flag: AssetsImages.otherCountries,
                  //   onTap: () {},
                  // ),
                ],
              ),
            )),
      ),
    );
  }
}

class CountryTile extends StatelessWidget {
  CountryTile(
      {super.key,
      required this.countryName,
      required this.flag,
      required this.onTap});
  final String countryName, flag;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            flag,
            height: 32.dy,
            width: 32.dx,
          ),
          SpaceX(8.dx),
          CustomText(
              text: countryName, fontSize: 16.sp, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
