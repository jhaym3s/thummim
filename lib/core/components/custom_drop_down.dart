import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thummim/core/components/components.dart';

import '../configs/configs.dart';

class DropDownTextFormField extends StatelessWidget {
  const DropDownTextFormField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.onTap,
      this.width = 343,
      this.suffixIcon,
      this.onChanged,
       this.keyboardType,
    this.inputFormatters,
      required this.validator})
      : super(key: key);
  final String? hintText;
  final String labelText;
  final TextEditingController controller;
  final double width;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(text: labelText, fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff505560),),
       
        SpaceY(4.dy),
        TextFormField(
           controller: controller,
           onTap: onTap,
           // maxLength: ,
           // maxLengthEnforcement: ,
           readOnly: true,
           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
               color: kTextColorsLight,
               fontSize: 14.sp,
               fontWeight: FontWeight.w400),
           cursorHeight: 20.dy,
           cursorColor: kTextColorsLight,
            keyboardType: keyboardType,
             inputFormatters: inputFormatters,
           decoration: InputDecoration(
             suffixIcon: suffixIcon, 
             //prefixIcon: Image.asset(AssetsImages.liberia, height: 4.dy, width: 4.dx,),
              //prefix: Image.asset(AssetsImages.liberia, height: 4.dy, width: 4.dx,),
             hintText: hintText,
             hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                 color: const Color(0xFFB7B7B9),
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w400),
              filled: true,
        fillColor:  const Color(0xffF9FAFB),
          contentPadding: EdgeInsets.symmetric(vertical: 16.0.dy, horizontal: 10.0.dx), 
         // border: InputBorder.none, 
          focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEAECF0)),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEAECF0)),
          borderRadius: BorderRadius.circular(8),
        ),
             border: InputBorder.none,
           ),
           onChanged: onChanged,
           onSaved: (newValue) {},
           validator: validator,
         ),
      ],
    );
  }
}
