import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/prefes/sharedPrefController.dart';
import 'package:job_app/utils/context-extenssion.dart';
import 'package:job_app/view/auth_screen/auth_widgets/data_forms.dart';
import 'package:job_app/view/auth_screen/profileconfirmation.dart';
import 'package:job_app/view/auth_screen/sign_up_screen.dart';
import 'package:job_app/view/auth_screen/verification_screen.dart';
import 'package:job_app/view/home_screens/home_page.dart';
import '../../controller/authController/sing_up_controller.dart';
import 'auth_widgets/PasswordField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SingUpController _SingUpController = Get.put(SingUpController());
  SharedPrefController _sharedPrefController = Get.put(SharedPrefController());
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String verificationFailMassage = '';
  bool isButtonDisabled = false;

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
                    'أهلا بعودتك 👋',
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
                      keybordType: TextInputType.emailAddress,
                      image: 'assets/images/starts/email.svg',
                      controller: _emailController),
                  SizedBox(height: height * .03),
                  PasswordField(
                    passcontroller: _passwordController,
                  ),
                  SizedBox(height: height * .04),
                  ElevatedButton(
                    onPressed: () async {
                                  bool isSignedIn =
                                      await _SingUpController.signIn(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                  if (isSignedIn) {
                                    _sharedPrefController.saveEmail(email: _emailController.text);
                                    Get.offAll( HomePage());
                                  } else {
                                    Get.snackbar(
                                        'Error', 'Please fill in all fields.');
                                  }


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'تسجيل دخول',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: height * .02),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ResetPassword');
                      },
                      child: Text('نسيت كلمة المرور؟',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ),
                  ),
                  SizedBox(height: height * .03),
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
                  SizedBox(height: height * .04),
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
                                Get.to(VerificationScreen(
                                    VerificationCode: "VerificationCode"));
                              },
                              icon: SvgPicture.asset(
                                  'assets/images/starts/google.svg'))),
                      BackContainer(
                          iconButton: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/starts/facebook.svg'))),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لا تمتلك حساب؟',
                        style: TextStyle(
                          color: subsTitleColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(SignUpScreen());
                        },
                        child: Text(
                          'تسجيل جديد',
                          style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkData() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields.');
      return;
    }
  }
}
