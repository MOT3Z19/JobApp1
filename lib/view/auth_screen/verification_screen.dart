import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/utils/context-extenssion.dart';
import 'package:job_app/view/auth_screen/profileconfirmation.dart';
import 'package:job_app/view/auth_screen/sign_up_screen.dart';
import 'package:job_app/view/home_screens/home_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'auth_widgets/codeDegits.dart';

class VerificationScreen extends StatefulWidget {
  final String VerificationCode;

  VerificationScreen({super.key, required this.VerificationCode});

  @override
  State<VerificationScreen> createState() => _verificationScreenState();
}

class _verificationScreenState extends State<VerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * .05, vertical: height * .13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'فرصة',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            Text(
              'تأكيد الرمز',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * .04),
            Text(
              'أدخل رمز التحقق الذي تم ارساله الى رقم \nالجوال الذي ارفقته',
              textAlign: TextAlign.center,
              style: TextStyle(color: subsTitleColor, fontSize: 17),
            ),
            SizedBox(height: height * .20),
            PinCodeTextField(
              length: 6,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeBorderWidth: .5,
                selectedColor: primaryColor,
                inactiveColor: subsTitleColor,
                disabledBorderWidth: .5,
                borderWidth: .5,
                inactiveBorderWidth: .5,
                activeColor: Colors.black,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: height / 17,
                fieldWidth: width / 8,
              ),
              animationDuration: Duration(milliseconds: 300),
              errorAnimationController: errorController,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  currentText = value;
                });
              },
              appContext: context,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                print(currentText);
                setState(() {
                  isButtonDisabled = true;
                });
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.VerificationCode,
                      smsCode: currentText);
                  await _auth.signInWithCredential(credential);
                  if (_auth.currentUser != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            const ProfileConfirmationScreen()));
                  }
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    verificationFailMassage = e.code;
                    context.shwoMassege(
                        message: 'خطأ , يُرجى التحقق الرمز في الرسالة ',
                        error: true);
                  });
                }

                setState(() {
                  isButtonDisabled = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'تأكيد الرمز',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
