import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';
class ResetPasswordConfirmation extends StatelessWidget {
  const ResetPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Close action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'فرصة',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColor
              ),

            ),
            SizedBox(height: 87),
            Image.asset(
              'assets/images/conf.png',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'تمت العملية بنجاح',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'تم تغيير كلمة السر الخاصة بك. الرجاء تسجيل الدخول\nباستخدام كلمة المرور الجديدة الخاصة بك...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                minimumSize: Size(double.infinity, 65),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'تسجيل دخول',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

