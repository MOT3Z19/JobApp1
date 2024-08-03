import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_app/controller/authController/authController.dart';
import 'package:job_app/controller/authController/sing_up_controller.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/usersDataModels/usersData.dart';
import 'package:job_app/prefes/sharedPrefController.dart';
import 'package:job_app/utils/context-extenssion.dart';
import 'package:job_app/view/auth_screen/profileconfirmation.dart';
import 'package:job_app/view/auth_screen/sign_in_screen.dart';
import 'package:job_app/view/auth_screen/verification_screen.dart';
import 'package:job_app/view/home_screens/UserHome/home_page.dart';
import 'auth_widgets/PasswordField.dart';
import 'auth_widgets/data_forms.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

SharedPrefController _sharedPrefController = Get.put(SharedPrefController());
SingUpController _SingUpController = Get.put(SingUpController());
AuthModel _auth = AuthModel();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
String verificationFailMassage = '';
String? idCode;
bool isButtonDisabled = false;
String? _completeNumber;
bool connect = false;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * .09),
                    Text(
                      'فرصة',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const Text(
                      ' تسجيل جديد 👍',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      'دعونا نسجل. التقدم للوظائف!',
                      style: TextStyle(color: subsTitleColor),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: height * .04),
                    DataTextField(
                      keybordType: TextInputType.name,
                      image: 'assets/images/starts/profile.svg',
                      controller: _nameController,
                    ),
                    SizedBox(height: height * .02),
                    _buildPhoneNumberField(),
                    SizedBox(height: height * .02),
                    DataTextField(
                      keybordType: TextInputType.emailAddress,
                      image: 'assets/images/starts/email.svg',
                      controller: _emailController,
                    ),
                    SizedBox(height: height * .02),
                    PasswordField(
                      passcontroller: _passwordController,
                    ),
                    SizedBox(height: height * .03),
                    ElevatedButton(
                      onPressed: () async {
                        _checkData();
                        setState(() {
                          isButtonDisabled =
                              true; // تعطيل الزر أثناء تنفيذ العملية
                        });

                        await _SingUpController.checkConnection()
                            ? await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: _completeNumber,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {
                                  setState(() {
                                    isButtonDisabled = false;
                                    context.shwoMassege(
                                        message:
                                            'خطأ , يُرجى التحقق من رقم الجوال ${e}',
                                        error: true);
                                    print('$e %%%%%%**********************');
                                  });
                                  setState(() {
                                    verificationFailMassage = e.code;
                                    context.shwoMassege(
                                        message:
                                            'خطأ , يُرجى التحقق من رقم الجوال ${e.code}',
                                        error: true);
                                    print(
                                        "${e.code}****************************&&");
                                  });
                                },
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  setState(() {
                                    isButtonDisabled = false;
                                  });



                                  Get.offAll(VerificationScreen(
                                    VerificationCode: verificationId,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    phoneNumber: _completeNumber ?? " ",
                                    userName: _nameController.text,
                                  ));
                                },
                                timeout: const Duration(seconds: 120),
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              )
                            : context.shwoMassege(
                                message: 'يرجى التأكد من الشبكة', error: true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'تسجيل جديد',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: height * .04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Divider(
                            thickness: 1.2,
                            color: Colors.grey.shade300,
                          ),
                          width: width / 3.5,
                        ),
                        Text(
                          '  أو التسجيل عبر  ',
                          style: TextStyle(color: subsTitleColor),
                        ),
                        Container(
                          child: Divider(
                            thickness: 1.2,
                            color: Colors.grey.shade300,
                          ),
                          width: width / 3.5,
                        )
                      ],
                    ),
                    SizedBox(height: height * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BackContainer(
                            iconButton: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              'assets/images/starts/apple.svg'),
                        )),
                        BackContainer(
                            iconButton: IconButton(
                                onPressed: () {
                                  _auth.signInWithGoogle();
                                },
                                icon: SvgPicture.asset(
                                    'assets/images/starts/google.svg'))),
                        BackContainer(
                            iconButton: IconButton(
                                onPressed: () {
                                  _auth.signInWithFacebook();
                                },
                                icon: SvgPicture.asset(
                                    'assets/images/starts/facebook.svg'))),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تمتلك حساب؟',
                          style: TextStyle(
                            color: subsTitleColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAll(LoginScreen());
                          },
                          child: Text(
                            'سجل الدخول',
                            style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildPhoneNumberField() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntlPhoneField(
        decoration: InputDecoration(
          suffixIcon: SvgPicture.asset(
            'assets/images/starts/phone.svg',
            fit: BoxFit.scaleDown,
          ),
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(),
          ),
        ),
        languageCode: "ar",
        onChanged: (phone) {
          setState(() {
            _completeNumber = phone.completeNumber;
          });
          print(phone.completeNumber + "********************");
          print("$_completeNumber ********************");
        },
        onCountryChanged: (country) {
          print('Country changed to: ' +
              country.name +
              "ccccccccccccccccccccccc");
        },
      ),
    );
  }

  Future<bool> _checkData() async {
    if (_emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    } else
      context.shwoMassege(message: 'يرجى إخال بيانات صحيحة', error: true);
    return false;
  }
}
