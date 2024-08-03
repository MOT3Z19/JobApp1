import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/view/outboarding_screen/outbooardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constansColor.dart';
import '../home_screens/UserHome/bottomBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email')??'';
    email.isEmpty?
    Get.offAll(OutboardingScreen()):Get.offAll(MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.black.withOpacity(1.0), primaryColor],
          end: AlignmentDirectional.topCenter,
          begin: AlignmentDirectional.bottomCenter,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.zoom_in,
                color: Colors.white,
                size: 50,
              ),
              Text('فُرصة',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 55))
            ],
          ),
        ),
      ),
    );
  }
}
