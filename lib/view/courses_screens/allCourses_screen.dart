import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/company/companyProfileController.dart';
import 'package:job_app/controller/firestoreController/courses/courseAdsController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/companyDataModels/courseAds.dart';
import 'package:job_app/view/profiles_screens/companyProfile_screens/storeCopmanyProfile.dart';
import 'package:job_app/view/requests_screen/request_widgets/requestCard.dart';
import 'course_adsScreen.dart';
import 'courses_datiles.dart';

class AllCoursesScreen extends StatefulWidget {
  const AllCoursesScreen({super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

final CompanyProfileController _companyProfileController =
    Get.put(CompanyProfileController());
final CourseAdsController _courseAdsController = Get.put(CourseAdsController());
bool savedIsExist = false;
bool savedIsVisible = false;

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              bool chekDoc =
                  await _companyProfileController.checkDocumentExists();
              setState(() {
                chekDoc ? savedIsExist = true : false;
              });
              bool isVisible = await _companyProfileController.isVisible();
              setState(() {
                isVisible ? savedIsVisible = true : false;
              });
              if ((savedIsExist & savedIsVisible) || (chekDoc & isVisible)) {
                Get.to(CourseScreen());
              } else if (savedIsExist = false || !chekDoc) {
                _makeAccount();
              } else if ((savedIsVisible = false & savedIsExist != false) ||
                  (chekDoc = true & isVisible != true)) {
                _waitAccount();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  'assets/images/profile_icons/jobType_icon/add.svg'),
            ),
          ),
          centerTitle: true,
          title: Text('الدورات'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: 'ابحث عن كورس ...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: subsTitleColor))),
              ),
              SizedBox(height: height * .02),
              Text('الدورات والكورسات المعلنة',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: height * .02),
              Expanded(
                child: FutureBuilder<List<Course>>(
                  future: _courseAdsController.getCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      printError(info: 'Error: ${snapshot.error}');
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return Center(child: Text('لا يوجد بيانات'));
                    }
                    List<Course> courses = snapshot.data!;
                    return SizedBox(
                      height: height/1.4,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Get.to(
                                      CourseDetailsPage(
                                        courseName: courses[index].courseName,
                                        courseHours:courses[index].courseHours,
                                        isCertified: courses[index].isCertified,
                                        courseLevel: courses[index].courseLevel,
                                        courseType: courses[index].courseType,
                                        coursePrice: courses[index].coursePrice,
                                        courseLocation:courses[index].courseLocation,
                                        courseDescription: courses[index].courseDescription,
                                        videoLink: courses[index].videoLink,
                                        courseDays: courses[index].courseDays,
                                      ));
                                },
                                child: RequestCard(
                                  courseAddress: courses[index].courseLocation ?? '',
                                  courseName: courses[index].courseName ?? '',
                                  courseType: courses[index].courseType ?? '',
                                  courseHours: courses[index].courseHours ?? '',
                                ));
                          },
                          itemCount: courses.length),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
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
              'يرجى فتح حساب شركة اولاً؛للوصول الى هذه الخاصية.',
              style: TextStyle(
                color: Colors.black45,
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
                width: width / 2,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
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
                width: width / 2,
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
                      'إغلاق النافذة',
                    )),
              ),
            ],
          );
        });
  }
}
