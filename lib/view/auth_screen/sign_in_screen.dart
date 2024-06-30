import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
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
              SizedBox(height: 10),
              Text(
                'دعونا نسجل. التقدم للوظائف!',
                style: TextStyle(color: Colors.grey.shade600),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 30),
              _buildPhoneNumberField(),
              SizedBox(height: 15),
              PasswordField(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
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
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('نسيت كلمة المرور؟',
                      style: TextStyle(color: Colors.grey.shade600)),
                ),
              ),
              Divider(thickness: 1, color: Colors.grey.shade300),
              Center(
                child: Text(
                  'أو التسجيل عبر',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/facebook.png')),
                  SizedBox(width: 20),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/google.png')),
                  SizedBox(width: 20),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/apple.png')),
                ],
              ),
              Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'تمتلك حساب؟ تسجيل جديد',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      languageCode: "ar",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ' + country.name);
      },
    );
  }

}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Image.asset('assets/images/lock.png'),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        hintText: '••••••••',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: _obscureText,
    );
  }
}
