import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/splash_screen/splashScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'controller/mood&Languge/stutasController.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(StatusController());
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
      themeMode: Get.find<StatusController>().theme,



      theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          actionIconTheme: ActionIconThemeData(
            backButtonIconBuilder: (context) => IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),
          dropdownMenuTheme: DropdownMenuThemeData(
              textStyle: TextStyle(
                  color: Colors.black
              ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: backSearchColor,
              filled: true,
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
          listTileTheme: ListTileThemeData(
              minVerticalPadding: 0,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Almarai',
              )),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontFamily: 'Almarai',
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Almarai',
                  ),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: primaryColor))

      ),



      darkTheme:ThemeData(
          brightness: Brightness.dark,
          actionIconTheme: ActionIconThemeData(
            backButtonIconBuilder: (context) => IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: TextStyle(
              color: Colors.white
            )
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 14,
              ),
              labelStyle: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 14,
              )),
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
          listTileTheme: ListTileThemeData(
              minVerticalPadding: 0,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Almarai',
              )),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontFamily: 'Almarai',
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Almarai',
                  ),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: primaryColor))),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
