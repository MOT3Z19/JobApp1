import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/jobType_screen.dart';

import 'employeeProfileEdit_screen.dart';

class MakeAccount extends StatelessWidget {
  const MakeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: height * .1),
            CircleAvatar(
                radius: width / 7,
                backgroundImage:
                    AssetImage('assets/images/outBoarding_Images/out4.jpg')),
            SizedBox(height: height * .009),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text('ميسرة نصار',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مطور تطبيقات',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: subsTitleColor)),
                SizedBox(height: height * .009),
                SvgPicture.asset(
                    'assets/images/home_icons/drawer_icon/check.svg'),
              ],
            ),
            SizedBox(height: height * .05),
            Image(
              image: AssetImage(
                'assets/images/resume.png',
              ),
              width: width / 2.5,
              height: height / 4,
            ),
            SizedBox(height: height * .05),
            Text(
              'لا يوجد بيانات لمفلك الشخصي',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: height * .01),
            Text(
              textAlign:TextAlign.center,
              'للأسف لا يوجد بيانات لعرضها, قم بانشاء سيرة ذاتية عنك لتتمكن من التقديم على الوظائف المتاحة في التطبيق وتزيد فرصتك في الحصول على وظائف ملائمة لك وسنقدم لك نماذج تساعدك في  بناء سيرتك الذاتية ',
              style: TextStyle(fontSize: 15, color: subsTitleColor),
            ),
            SizedBox(height: height * .03),
            ElevatedButton(
              onPressed: () {
                Get.to(JobTypeScreen());
                // Button action
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF356899),
                minimumSize: Size(double.infinity, 60),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'إنشاء سيرة ذاتية',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
