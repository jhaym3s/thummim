import 'package:flutter/material.dart';
import 'package:thummim/dashbord.dart';
import 'package:thummim/features/authentication/screens/onboarding_screen.dart';
import 'package:thummim/core/configs/configs.dart';
import 'package:thummim/core/helpers/router/router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:thummim/features/dashboard/home/domain/modal/courses.dart';
import '../../../core/configs/storage_box.dart';
import '../../../core/helpers/hive_repository.dart';
import '../../../core/helpers/shared_preference_manager.dart';

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
    late String _country;
    
     @override
  void initState() {
      firstTime = SharedPreferencesManager.getBool(PrefKeys.isFirstTime);
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
        _getCountry();
       Future.delayed(const Duration(seconds: 3)).then((value) {
        //moveAndClearStack(context: context, page: OnBoardingScreen.routeName);
        if (firstTime) {
          moveAndClearStack(context: context,  
        page:  OnBoardingScreen.routeName);
        return;
        }else {
        moveAndClearStack(context: context,  
        page:  CustomNavigationBar.routeName);
        return;
        }
      });
      super.initState();
  }
   _prepareAppState() async {
     await HiveRepository.openHives([
      HiveKeys.courses,
    //  HiveKeys.rentals,
    ]);
      List<Courses> courses;
    //  List<Rentals> rentals;
     try {
        courses = _hiveRepository.get<List<Courses>>(
           key: HiveKeys.courses, name: HiveKeys.courses ,);
     } catch (e) {}
   }
  
  
  Future<void> _getCountry() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return; // Location services are not enabled
      }
      // Request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          return; // Permissions are denied
        }
      }
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      // Reverse geocoding to get place details
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      print("country ${placemarks}");
      print("country ${place}");
      print("country ${place.country}");
      SharedPreferencesManager.setString(PrefKeys.userCountry, place.country);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsImages.onboarding))
        ),
        child: Center(
          child: Image.asset(AssetsImages.logo, height: 102.dy, width: 300.dx,),
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


