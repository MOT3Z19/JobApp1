import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/authController/authWithEmail&PassController.dart';
import 'package:job_app/controller/firestoreController/company/companyProfileController.dart';
import 'package:job_app/controller/firestoreController/serviceProvider/serviceProviderProfileController.dart';
import 'package:job_app/controller/firestoreController/user/userProfileController.dart';
import 'package:job_app/controller/mood&Languge/stutasController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/prefes/sharedPrefController.dart';
import 'package:job_app/view/auth_screen/sign_in_screen.dart';
import 'package:job_app/view/courses_screens/course_adsScreen.dart';
import 'package:job_app/view/drawerOthersTabs_screen/contactWith.dart';
import 'package:job_app/view/drawerOthersTabs_screen/policyTab.dart';
import 'package:job_app/view/drawerOthersTabs_screen/supporters&founders.dart';
import 'package:job_app/view/job_screens/store_Job.dart';
import 'package:job_app/view/profiles_screens/companyProfile_screens/companyProfile.dart';
import 'package:job_app/view/profiles_screens/companyProfile_screens/storeCopmanyProfile.dart';
import 'package:job_app/view/profiles_screens/serviceProvider_screens/serviceProviderProfile.dart';
import 'package:job_app/view/profiles_screens/serviceProvider_screens/storeServiceProvider.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/jobPersonalScreen.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/viewUserProfile_screen/employeeProfile_screen.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/viewUserProfile_screen/makeAccount_screen.dart';
import '../home_widgets/CourseCard.dart';
import '../home_widgets/buildJobCard.dart';
import '../home_widgets/buildPopularJobs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final AuthWithEmailAndPassController _singUpController =
    Get.put(AuthWithEmailAndPassController());
final ProfileDataController _profileDataController =
    Get.put(ProfileDataController());
final StatusController _statusController = Get.put(StatusController());
final ServiceProviderProfileController _serviceFormController =
    Get.put(ServiceProviderProfileController());
final CompanyProfileController _companyProfileController =
    Get.put(CompanyProfileController());
final SharedPrefController _sharedPrefController = Get.put(SharedPrefController());


final PageController _controller = PageController();
int _currentPage = 0;
bool? isConnection;
bool savedIsExist = false;
bool savedIsVisible = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
          elevation: 3,
          width: width / 1.23,
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: height * .02, horizontal: 10),
            children: <Widget>[
              Builder(builder: (context) {
                return IconButton(
                    padding: EdgeInsetsDirectional.only(top: 1),
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(Icons.close),
                    alignment: AlignmentDirectional.bottomStart);
              }),
              CircleAvatar(
                  radius: width / 9,
                  backgroundImage:
                      AssetImage('assets/images/outBoarding_Images/out4.jpg')),
              SizedBox(height: height * .01),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text('ميسرة نصار',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(height: height * .03),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () async {
                    bool employeeExist =
                        await _profileDataController.checkEmployeeExists();
                    employeeExist
                        ? Get.to(EmployeeProfile())
                        : Get.to(MakeAccount());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/info.svg'),
                    title: Text('الملف الشخصي'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () async {
                    bool chekDoc =
                        await _companyProfileController.checkDocumentExists();
                    setState(() {
                      chekDoc ? savedIsExist = true : false;
                    });
                    bool isVisible =
                        await _companyProfileController.isVisible();
                    setState(() {
                      isVisible ? savedIsVisible = true : false;
                    });
                    print('EXIST ## $chekDoc');
                    print('isVisible ## $isVisible');
                    if ((savedIsExist & savedIsVisible) ||
                        (chekDoc & isVisible)) {
                      Get.to(CopmanyProfileScreen());
                    } else if (savedIsExist = false || !chekDoc) {
                      _makeAccount();
                    } else if ((savedIsVisible =
                            false & savedIsExist != false) ||
                        (chekDoc = true & isVisible != true)) {
                      _waitAccount();
                    }
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/companyPro.svg'),
                    title: Text('بروفايل شركات'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () async {
                    bool documentExists =
                        await _serviceFormController.checkDocumentExists();
                    documentExists
                        ? Get.to(ServiceProviderProfile())
                        : Get.to(ServiceFormScreen());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/serviceProvider.svg'),
                    title: Text('بروفايل مزود الخدمة'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: ListTile(
                  leading: Obx(() => Switch(
                      value: _statusController.isDarkMode.value,
                      onChanged: (value) {
                        _statusController.toggleTheme();
                      })),
                  title: Text('الوضع الليلي'),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () {
                    Get.to(EmployeeProfile());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/share.svg'),
                    title: Text('مشاركة التطبيق'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/reviw.svg'),
                    title: Text('تقييم التطبيق'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () {
                    Get.to(SupportersAndFounders());
                  },
                  child: ListTile(
                    leading: Image.asset(
                      width: 30,
                      height: 30,
                      'assets/images/home_icons/drawer_icon/volunteering.png',
                    ),
                    title: Text('الداعمون و المؤسسون'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () {
                    Get.to(PolicyTabScreen());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/polisy.svg'),
                    title: Text('سياسة الخصوصية'),
                  ),
                ),
              ),
              SizedBox(
                height: height / 16,
                child: InkWell(
                  onTap: () {
                    Get.to(ContactWithUs());
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/concat.svg'),
                    title: Text(
                      'تواصل معنا',
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              InkWell(
                onTap: () {
                  _confirmLogOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/logout.svg',
                      width: 20,
                      height: 16.6,
                    ),
                    Text(
                      '  تسجيل الخروج   ',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .03),
          child: SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .009),
                Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            CircleAvatar(
                                radius: width / 13,
                                backgroundImage: AssetImage(
                                    'assets/images/outBoarding_Images/out4.jpg')),
                            Visibility(
                              visible: isConnection ?? true,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: width * .02, right: width * .01),
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: width * .025, right: width * .015),
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      width: width * .03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('مرحبا بك',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Text('ميسرة نصار 👋',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/images/home_icons/page_icons/notifcations.svg'
                        ))
                  ],
                ),
                SizedBox(height: height * .03),
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: width / 7,
                          height: height / 14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(CourseScreen());
                            },
                            icon: SvgPicture.asset(
                              'assets/images/home_icons/page_icons/filter.svg',
                              width: double.infinity,
                              height: double.infinity,
                            )),
                      ],
                    ),
                    SizedBox(width: width * .02),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: 'Almarai', fontSize: 15),
                        decoration: InputDecoration(
                          fillColor:Theme.of(context).primaryColor ,
                          filled: true,
                          hintText: 'ابحث عن وظيفتك...',
                          suffixIcon: SvgPicture.asset(
                            'assets/images/home_icons/page_icons/search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     TextButton(onPressed: (){Get.to(CourseScreen());}, child: Text('تخزين دورة')),
                //     TextButton(onPressed: (){Get.to(JobAdvertisementScreen());}, child: Text("تخزين وظيفة")),
                //     TextButton(onPressed: (){Get.to(ServiceFormScreen());}, child: Text("تخزين خدمة")),
                //     TextButton(onPressed: (){Get.to(JobPersonalScreen());}, child: Text("تخزين شخصي")),
                //     TextButton(onPressed: (){Get.to(CompanyProfileForm());}, child: Text("تخزين شركة")),
                //
                //   ],
                // ),
                Row(
                  children: [
                    Text('أحد ث الوظائف',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            alignment: AlignmentDirectional.centerEnd),
                        onPressed: () {},
                        child: Text('المزيد',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF95969D))))
                  ],
                ),
                Container(
                    height: height / 4.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return buildJobCard(
                          title: 'مدخل بيانات',
                          company: 'شركة Shell plc',
                          imageUrl:
                              'assets/images/home_icons/page_icons/logo.png',
                          salary: '\$200-\$300',
                          type: 'دوام كامل',
                          location: 'العراق، بغداد، شارع المكتبة',
                          experience: '2-3 سنوات خبرة',
                        );
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.only(
                          left: width * .01,
                          right: width * .01,
                          top: width * .03),
                      width:
                          _currentPage == index ? width * 0.05 : width * 0.02,
                      height: height * 0.01,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? primaryColor
                            : subsTitleColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('جميع الوظائف',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            alignment: AlignmentDirectional.centerEnd),
                        onPressed: () {},
                        child: Text('المزيد',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF95969D))))
                  ],
                ),
                //buildPopularJobs(),
                Row(
                  children: [
                    Text('الدورات',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            alignment: AlignmentDirectional.centerEnd),
                        onPressed: () {},
                        child: Text('المزيد',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF95969D))))
                  ],
                ),
                Container(
                  height: height * .4,
                  decoration: BoxDecoration(),
                  child: GridView.builder(
                      physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return CourseCard(
                            title: 'برمجة',
                            description: 'دورة لتعليم اساسيات البرمجة...',
                            price: '\$500',
                            imageUrl:
                                'assets/images/home_icons/page_icons/noon.png');
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void open() {
    Scaffold.of(context).openDrawer();
  }

  void _confirmLogOut() {
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
                fontSize: 16,
                fontFamily: 'Almarai',
              ),
            ),
            actions: [
              Container(
                width: width / 2.9,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      _singUpController.logout();
                      _sharedPrefController.removeUser();
                      Get.offAll(LoginScreen());
                    },
                    child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Almarai',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                      'تسجيل الخروج',
                    )),
              ),
              Container(
                width: width / 2.9,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade300),
                    onPressed: () async {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                      'الغاء',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )),
              ),
            ],
          );
        });
  }

  void _makeAccount() {
    showDialog(
        context: context,
        builder: (context) {
          double width = MediaQuery.of(context).size.width;
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: AlignmentDirectional.center,
            title: Text('عذراً',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w500,
                    fontSize: 24)),
            content: Text(
              'يرجى فتح حساب شركة اولاً ؛ للوصول الى هذه الخاصية.',
              style: TextStyle(
                color: subsTitleColor,
                fontSize: 16,
                fontFamily: 'Almarai',
              ),
            ),
            actions: [
              Container(
                width: width,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      Get.to(CompanyProfileForm());
                    },
                    child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Almarai',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                      'انشاء بروفايل شركة',
                    )),
              ),
            ],
          );
        });
  }

  void _waitAccount() {
    showDialog(
        context: context,
        builder: (context) {
          double width = MediaQuery.of(context).size.width;
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: AlignmentDirectional.center,
            title: Text('عذراً',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w500,
                    fontSize: 24)),
            content: Text(
              'يرجى انتظار الموافقة على حساب الشركة الخاص بك؛للوصول الى هذه النافذة.',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontFamily: 'Almarai',
              ),
            ),
            actions: [
              Container(
                width: width / 3,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {},
                    child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Almarai',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                      'التواصل مع الادمن',
                    )),
              ),
              Container(
                width: width / 3,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Almarai',
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                      'إغلاق/ النافذة',
                    )),
              ),
            ],
          );
        });
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isConnection = true;
        });
        print('connected');
        print("$isConnection ccccccccccccccccccccccccccccccc");
      }
      return true;
    } on SocketException catch (_) {
      setState(() {
        isConnection = false;
      });
      print('not connected');
      print("$isConnection ccccccccccccccccccccccccccccccc");
    }
    return false;
  }
}
