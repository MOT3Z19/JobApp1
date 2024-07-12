import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';

class MakeAccountt extends StatelessWidget {
  const MakeAccountt({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Padding(padding: EdgeInsets.all(.8),
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                      radius: width / 9,
                      backgroundImage:
                      AssetImage('assets/images/outBoarding_Images/out4.jpg')),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text('ميسرة نصار',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(height: height * .009),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/home_icons/drawer_icon/check.svg'),
                      Text('مطور تطبيقات',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: subsTitleColor)),
                      Image(image: AssetImage('assets/images/resume.png',),width: 50,),
                      Text(
                        'لا يوجد بيانات لمفلك الشخصي',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        'للأسف لا يوجد بيانات لعرضها, قم بانشاء سيرة ذاتية عنك لتتمكن من التقديم على الوظائف المتاحة في التطبيق وتزيد فرصتك في الحصول على وظائف ملائمة لك وسنقدم لك نماذج تساعدك في  بناء سيرتك الذاتية  . . . ',
                        style: TextStyle(fontSize: 14, color: subsTitleColor),

                      ),
                      ElevatedButton(onPressed: (){}, child: Text('انشاء سيرة ذاتية'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )
                    ],
                  ),
                ],


              )],
          )
      ),
    );
  }
}
