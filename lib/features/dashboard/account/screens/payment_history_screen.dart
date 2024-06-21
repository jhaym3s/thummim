import 'package:flutter/material.dart';
import 'package:thummim/features/dashboard/home/screens/home_screen.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class PaymentHistory extends StatefulWidget {
  static const routeName = "paymentHistoryScreen";
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "Payment History", fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SpaceY(24.dy),
          Container(
            width: kScreenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 16.dx,vertical: 16.dy),
            color: kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
            text: "May 2023 ", fontSize: 14.sp, fontWeight: FontWeight.w400),
            SpaceY(24.dy),
            PaymentTile(),
            SpaceY(24.dy),
            PaymentTile(),
              ],
            ),
          ),
          SpaceY(24.dy),
          Container(
            width: kScreenWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 16.dx,vertical: 16.dy),
            color: kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
            text: "May 2023 ", fontSize: 14.sp, fontWeight: FontWeight.w400),
            SpaceY(24.dy),
            PaymentTile(),
            SpaceY(24.dy),
            PaymentTile(),
              ],
            ),
          ),
          ],
        )
        ,
      )
      ,
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle,color: Color(0xff29C07A),),
        SpaceX(16.dx),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                      text: "Payment Successful - Cell Skills Training Series I: Resilience ", fontSize: 16.sp, fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,color: Color(0xff29303D),),
                      CustomText(
                      text: "May 04, 2023 ", fontSize: 14.sp, fontWeight: FontWeight.w400),
            ],
          ),
        ),
    
        CustomText(
    text: "₦10,000", fontSize: 16.sp, fontWeight: FontWeight.w600),
      ],
    );
  }
}