import 'package:flutter/material.dart';

import '../configs/configs.dart';

Future<void> showModalSheetWithRadius({
  required BuildContext context, required Widget returnWidget, required double height}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
    ),
    isScrollControlled: true,
    //isDismissible: true,
    builder: (BuildContext context) {
      return Container(
      height: kScreenHeight(context) * 1 - height.dy,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        bottomRight: Radius.circular(40.0),
        topLeft: Radius.circular(40.0),
      )
          ),
      child: returnWidget,
  
    );
    },
  );
}

Future<void> showModalSheet({required BuildContext context, required Widget returnWidget,required double height, bool isDismissible = true}) {
  return showModalBottomSheet<void>(
    context: context,
    isDismissible: isDismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        //top: Radius.circular(30),
      ),
    ),
    isScrollControlled: true,
    //isDismissible: true,
    builder: (BuildContext context) {
      return Container(
      height: kScreenHeight(context) * 1 - height.dy,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(0.0),
      )
          ),
      child: returnWidget,
  
    );
    },
  );
}
