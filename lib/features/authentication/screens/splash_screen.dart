import 'package:flutter/material.dart';
import 'package:thummim/features/authentication/screens/select_country_screen.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/core/helpers/router/router.dart';

import '../../../core/components/components.dart';
import '../../../core/helpers/hive_repository.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
    late AnimationController _controller;
    //late Animation<double> _animation;
    final HiveRepository _hiveRepository = HiveRepository();
    late bool firstTime;
    
     @override
  void initState() {
    //  firstTime = SharedPreferencesManager.getBool(PrefKeys.isFirstTime);
    //  tenant = SharedPreferencesManager.getBool(PrefKeys.isTenant);
    _prepareAppState();
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    // _animation = Tween<double>(begin: -300, end: 0).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.bounceOut,
    //   ),
    // );
      _controller.forward();
       Future.delayed(const Duration(seconds: 3)).then((value) {
        moveAndClearStack(context: context, page: SelectCountryScreen.routeName);
        // if (firstTime) {
        //   moveAndClearStack(context: context,  
        // page:  OnBoardingScreen.routeName);
        // return;
        // }else if(!firstTime && tenant){
        // moveAndClearStack(context: context,  
        // page:  CustomNavigationBar.routeName);
        // return;
        // }else{
        //      moveAndClearStack(context: context,  
        // page:  AgentCustomNavigationBar.routeName);
        // return;
        // }
      });
      super.initState();
  }
   _prepareAppState() async {
     await HiveRepository.openHives([
    //  HiveKeys.favorite,
    //  HiveKeys.rentals,
    ]);
    //  List<dynamic> favorite;
    //  List<Rentals> rentals;
     try {
      //  favorite = _hiveRepository.get<List<dynamic>>(
      //      key: HiveKeys.favorite, name: HiveKeys.favorite,);
      //     rentals = _hiveRepository.get<List<Rentals>>(
      //      key: HiveKeys.rentals, name: HiveKeys.rentals,);
     } catch (e) {}
   }
  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: CustomText(
                  text: "Thummim Med",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: kWhite,
                ),
      ),
    );
  }
     @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
}
