import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:job_app/view/splash_screen/splashScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),

          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 14,
              ),
              labelStyle: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 14,
              )),

          backgroundColor: Colors.red,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'Almarai',
            ),
            bodyText2: TextStyle(
              fontFamily: 'Almarai',
            ),
            button: TextStyle(
              fontFamily: 'Almarai',
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontFamily: 'Almarai',
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2C557D)))),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
