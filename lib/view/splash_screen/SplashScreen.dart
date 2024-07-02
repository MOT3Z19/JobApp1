import 'package:flutter/material.dart';
import 'package:job_app/view/outboarding_screen/outbooardingScreen.dart';

import '../../core/constansColor.dart';

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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
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
