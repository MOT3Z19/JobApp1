import 'package:flutter/material.dart';
import 'package:job_app/view/auth_screen/sign_in_screen.dart';
import 'package:job_app/view/splash_screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      },
    );
  }
}
