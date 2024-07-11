import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:thummim/features/authentication/domain/services/authentication_service.dart';
import 'core/helpers/network_call_managers.dart';
import 'core/helpers/shared_preference_manager.dart';
import 'features/authentication/domain/bloc/authentication_bloc.dart';
import 'features/authentication/screens/splash_screen.dart';
import 'core/configs/configs.dart';
import 'core/helpers/router/app_route.dart';
import 'features/dashboard/account/bloc/profile_bloc.dart';
import 'features/dashboard/account/service/profile_service.dart';
import 'simple_bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await _openHive();
  final apiClient = ApiClient();
  final authenticationService = AuthenticationService(apiClient: apiClient);
  final profileService = ProfileService(apiClient: apiClient);
  runApp( MyApp(
    authenticationService: authenticationService, profileService: profileService,
    
    ));
   await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],);
    Bloc.observer = AppBlocObserver();
  Bloc.transformer;
}

_openHive() async {
  var appDocDir = await pp.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.init(appDocDir.path);
  await SharedPreferencesManager.init();
  // Hive.registerAdapter(RentalsAdapter());
  // Hive.registerAdapter(PhotoAdapter());
  // Hive.registerAdapter(ProfileAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authenticationService, required this.profileService});
  final AuthenticationService authenticationService;
  final ProfileService profileService;
 @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(
                authenticationService: authenticationService)),
        BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(
                profileService: profileService)),
       ],
        child: GlobalLoaderOverlay(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Thummim',
              theme: AppTheme().lightTheme,
              onGenerateRoute: AppRouter.onGenerated,
              builder: (context, widget) {
                final media = MediaQuery.of(context);
                Dims.setSize(media);
                return widget!;
              },
              home: const SplashScreen(),
            ),
          ),
     
    );
  }
}

