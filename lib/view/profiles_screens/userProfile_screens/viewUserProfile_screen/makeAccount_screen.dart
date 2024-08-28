import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/jobPersonalScreen.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/jobType_screen.dart';

import 'employeeProfileEdit_screen.dart';

class MakeAccount extends StatelessWidget {
  const MakeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
                radius: width / 7,
                backgroundImage:
                    AssetImage('assets/images/outBoarding_Images/out4.jpg')),
            SizedBox(height: height * .009),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/home_icons/drawer_icon/check.svg'),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text('  ميسرة نصار',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: height*.07),
            Image(
              image: AssetImage(
                'assets/images/resume.png',
              ),
              width: width / 2.5,
              height: height / 4,
            ),
            SizedBox(height: height * .03),
            Text(
              'لا يوجد بيانات لمفلك الشخصي',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: height * .03),
            Text(
              textAlign: TextAlign.center,
              'للأسف لا يوجد بيانات لعرضها, قم بانشاء سيرة ذاتية عنك لتتمكن من التقديم على الوظائف المتاحة في التطبيق وتزيد فرصتك في الحصول على وظائف ملائمة لك وسنقدم لك نماذج تساعدك في  بناء سيرتك الذاتية...',
              style: TextStyle(fontSize: 15, color: subsTitleColor),
            ),
            SizedBox(height: height * .05),
            ElevatedButton(
              onPressed: () {
                Get.to(JobPersonalScreen());
                // Button action
              },
              child: Text(
                'إنشاء سيرة ذاتية',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
