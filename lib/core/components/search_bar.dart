import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thummim/core/components/components.dart';
import 'package:thummim/core/configs/configs.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.width = 343,
      this.suffixIcon,
      this.onChanged,
       this.keyboardType,
    this.inputFormatters,
      })
      : super(key: key);
  final String? hintText;
  final TextEditingController controller;
  final double width;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
           controller: controller,
           // maxLength: ,
           // maxLengthEnforcement: ,
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
             prefixIcon: const Icon(CupertinoIcons.search, color: Color(0xff9A9A93),),
             hintText: hintText,
             hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                 color: const Color(0xFFB7B7B9),
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w400),
              filled: true,
        fillColor:  const Color(0xffF4F5F5),
          contentPadding: EdgeInsets.symmetric(vertical: 12.0.dy, horizontal: 10.0.dx), 
          border: InputBorder.none, 
        //   focusedBorder: OutlineInputBorder(
        // // borderSide: const BorderSide(color: kTextColorsLight),
        //   borderRadius: BorderRadius.circular(8),
        // ),
        // border: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Color(0xffE0DFDF)),
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        // enabledBorder: OutlineInputBorder(
        //    borderSide: const BorderSide(color: Color(0xffE0DFDF)),
        //   borderRadius: BorderRadius.circular(8),
        // ),
            // border: InputBorder.none,
           ),
           onChanged: onChanged,
           onSaved: (newValue) {},
         ),
      ],
    );
  }
}
