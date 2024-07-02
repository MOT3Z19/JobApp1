import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/auth_screen/auth_widgets/data_forms.dart';
import 'auth_widgets/PasswordField.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .04),
              Text(
                'فرصة',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
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
                style: TextStyle(color: Colors.grey.shade600),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: height * .04),
              DataTextField(image: 'assets/images/lock.png'),
              // _buildPhoneNumberField(),
              SizedBox(height: height * .03),
              PasswordField(),
              SizedBox(height: height * .04),
              ElevatedButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '+44 7123 123 456',
                  //   verificationCompleted: (PhoneAuthCredential credential) {},
                  //   verificationFailed: (FirebaseAuthException e) {},
                  //   codeSent: (String verificationId, int? resendToken) {},
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'تسجيل دخول',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: height * .02),
              Center(
                child: TextButton(
                  onPressed: () {},
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
                    style: TextStyle(color: Colors.grey.shade600),
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
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/facebook.png')),

                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/google.png')),

                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/apple.png')),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لا تمتلك حساب؟',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child: Text(
                      'تسجيل جديد',
                      style: TextStyle(
                        color: Colors.blue.shade800,
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
    );
  }

// Widget _buildPhoneNumberField() {
//   return IntlPhoneField(
//     decoration: InputDecoration(
//       labelText: '',
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(),
//       ),
//     ),
//     languageCode: "ar",
//     onChanged: (phone) {
//       print(phone.completeNumber);
//     },
//     onCountryChanged: (country) {
//       print('Country changed to: ' + country.name);
//     },
//   );
// }
}
