import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screens/splashScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // getting the default directory of application for hive db
  Pref.initialize();
  // setting UI mode
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),

          titleTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),

      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
