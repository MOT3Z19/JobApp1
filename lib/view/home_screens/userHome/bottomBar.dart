import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/authController/sing_up_controller.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/companyDataModels/companyProfileModel.dart';
import 'package:job_app/view/courses_screens/allCourses_screen.dart';
import 'package:job_app/view/home_screens/UserHome/home_page.dart';
import 'package:job_app/view/profiles_screens/companyProfile_screen/companyProfile.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/viewUserProfile_screen/makeAccount_screen.dart';

import '../../auth_screen/sign_in_screen.dart';
import '../../profiles_screens/userProfile_screens/viewUserProfile_screen/jobsRequests_screen.dart';
import '../../requests_screen/allRequest_screen.dart';
import '../../settings_screen/settings_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SingUpController _singUpController = Get.put(SingUpController());

  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    AllCoursesScreen(),
    AllRequestSceen(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
          elevation: 3,
          width: width / 1.3,
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: 0.1, horizontal: 10),
            children: <Widget>[
              Builder(builder: (context) {
                return IconButton(
                    padding: EdgeInsetsDirectional.only(top: 1),
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(Icons.close, color: subsTitleColor),
                    alignment: AlignmentDirectional.bottomStart);
              }),
              CircleAvatar(
                  radius: width / 9,
                  backgroundImage: AssetImage(
                      'assets/images/outBoarding_Images/out4.jpg')),
              SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text('ميسرة نصار',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(height: height * .009),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/check.svg'),
                  Text('مطور تطبيقات',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: subsTitleColor)),
                ],
              ),
              InkWell(
                radius: 10,
                onTap: () {},
                child: Text(
                  textAlign: TextAlign.center,
                  'تبديل الحساب',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ),
              InkWell(
                onTap: () {


                  Get.to(CopmanyProfileScreen());
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/info.svg'),
                  title: Text('الملف الشخصي'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/company.svg'),
                  title: Text('بروفايل شركات'),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(JobRequests());
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/requests.svg'),
                  title: Text('طلبات التوظيف'),
                ),
              ),
              RadioListTile(
                value: true,
                groupValue: bool,
                onChanged: (printError) {},
                title: Text('الوضع الليلي'),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/share.svg'),
                  title: Text('مشاركة االتطبيق'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/reviw.svg'),
                  title: Text('تقييم التطبيق'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Image.asset(
                    width: 30,
                    height: 30,
                    'assets/images/home_icons/drawer_icon/volunteering.png',
                  ),
                  title: Text('الداعمون و المؤسسون'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/polisy.svg'),
                  title: Text('سياسة الخصوصية'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/concat.svg'),
                  title: Text('التواصل معنا'),
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              InkWell(
                onTap: () {
                  _confirmLogOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/logout.svg'),
                    Text(
                      '  تسجيل الخروج   ',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .02,
              )
            ],
          )),
      body: _tabs[_currentIndex], // Display the current tab's content
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Update the current tab when a new tab is tapped
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/home.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/homeS.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/play.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/playS.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/request.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/requestS.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Builder(builder: (context) {
              return InkWell(
                  onTap: () {

                    print('yes');
                    print('yes');
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(
                      'assets/images/home_icons/bottomBar_icon/category.svg'));
            }),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/categoryS.svg'),
            label: '',
          ),
        ],
      ),
    );
  }
  Future<void> _confirmLogOut() async {

    showDialog(

        context: context,
        builder: (context) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return AlertDialog(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: AlignmentDirectional.center,
            title: Text('تسجيل الخروج',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w500,
                    fontSize: 24)),
            content: Text(
              textAlign: TextAlign.center,
              'هل أنت متأكد من تسجيل الخروج؟',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontFamily: 'Almarai',
              ),
            ),
            actions: [
              Container(
                width: width/2.9,
                child: TextButton(

                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      _singUpController.logout();
                      Get.offAll(LoginScreen());

                    },
                    child: Text(
                      style:
                      TextStyle(color: Colors.white, fontFamily: 'Almarai',fontSize: 16,fontWeight: FontWeight.w300),
                      'تسجيل الخروج',
                    )),
              ),
              Container(
                width: width/2.9,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade300),
                    onPressed: () async {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                      'الغاء',
                      style: TextStyle(color: Colors.black, fontSize: 16,),
                    )),
              ),

            ],
          );
        });
  }

}
