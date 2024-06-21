import 'package:flutter/material.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/components/custom_text.dart';
import 'package:thummim/core/components/search_bar.dart';

import '../../../../core/configs/configs.dart';
import '../../../authentication/widgets/password_requirement.dart';


class PasswordPopUp extends StatefulWidget {
  const PasswordPopUp({
    Key? key,
    this.height = 150, 
  }) : super(key: key);
  final double? height;
  

  @override
  State<PasswordPopUp> createState() => _PasswordPopUpState();
}

class _PasswordPopUpState extends State<PasswordPopUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final oldController = TextEditingController();
  final newController = TextEditingController();

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
                          text: "Change Password",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                      const SizedBox()
                    ],
                  ),
                  SpaceY(24.dy),
                  PasswordTextFormField(hintText: "*****", labelText: "Current Password", controller: oldController, validator: (String? value){return null;}, hidePassword: true, suffixFunction: () {},),
                  SpaceY(40.dy),
                  PasswordTextFormField(hintText: "*****", labelText: "New Password", controller: newController, validator: (String? value){return null;}, hidePassword: true, suffixFunction: () {},),
                  SpaceY(8.dy),
              const PasswordRequirement(),
              SpaceY(8.dy),
              const PasswordRequirement(),
               SpaceY(8.dy),
              const PasswordRequirement(),
               SpaceY(8.dy),
              const PasswordRequirement(),
              SpaceY(8.dy),
              const PasswordRequirement(),
                ],
              ),
            )),
      ),
    );
  }
}