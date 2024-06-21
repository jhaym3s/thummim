import 'package:flutter/material.dart';
import 'package:thummim/core/components/components.dart';
import '../configs/configs.dart';


class CustomOutlinedButton extends StatefulWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.color = kPrimaryColor,
    this.textColor = kWhite,
    this.width = double.infinity,
    this.height = 48,
  }) : super(key: key);
  final Function()? onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: widget.width!.dx,
        height: widget.height!.dy,
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            alignment: Alignment.center,
            // backgroundColor: MaterialStateProperty.resolveWith<Color>(
            //   (Set<MaterialState> states) {
            //     if (states.contains(MaterialState.pressed)) {
            //       return widget.color;
            //     } else if (states.contains(MaterialState.disabled)) {
            //       return widget.color.withOpacity(0.5);
            //     }
            //     return widget.color; // Use the component's default.
            //   },
            // ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          child: CustomText(text: widget.buttonText, fontSize: 14.sp, fontWeight: FontWeight.w400,color: kTextColorsLight),
        ),
      ),
    );
  }
}
