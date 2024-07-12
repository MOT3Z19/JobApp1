import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:job_app/view/auth_screen/profileconfirmation.dart';
import 'package:job_app/view/auth_screen/sign_in_screen.dart';
import 'package:job_app/view/auth_screen/sign_up_screen.dart';
import 'package:job_app/view/auth_screen/verification_screen.dart';
import 'package:job_app/view/home_screens/home_page.dart';
import 'package:job_app/view/splash_screen/splashScreen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(

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

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => SplashScreen(),
        '/log_in': (context) => LoginScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/HomePage': (context) => HomePage(),
        '/ResetPassword': (context) => ProfileConfirmationScreen(),
        '/verification_screen': (context) => VerificationScreen(
              VerificationCode: '',
            ),
      },
    );
  }
}
