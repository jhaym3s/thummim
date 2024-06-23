import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'core/helpers/shared_preference_manager.dart';
import 'features/authentication/screens/splash_screen.dart';
import 'core/configs/configs.dart';
import 'core/helpers/router/app_route.dart';
import 'simple_bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await _openHive();
  runApp(const MyApp());
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
  const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return  GlobalLoaderOverlay(
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
      );
  }
}

