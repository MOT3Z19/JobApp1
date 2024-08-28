import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/company/companyProfileController.dart';
import 'package:job_app/controller/firestoreController/jobs/JobAdsController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/companyDataModels/JobAdvertisement.dart';
import 'package:job_app/view/job_screens/store_Job.dart';
import '../home_screens/home_widgets/buildPopularJobs.dart';
import '../profiles_screens/companyProfile_screens/storeCopmanyProfile.dart';

class JobRequests extends StatefulWidget {
  const JobRequests({super.key});

  @override
  State<JobRequests> createState() => _JobRequestsState();
}

final CompanyProfileController _companyProfileController =
    Get.put(CompanyProfileController());
JobAdsController _jobAdsController = Get.put(JobAdsController());
bool savedIsExist = false;
bool savedIsVisible = false;

class _JobRequestsState extends State<JobRequests> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Get.to(JobAdvertisementScreen());
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
        title: Text(
          'الوظائف',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: 'ابحث عن وظيفة ...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: subsTitleColor))),
              ),
              SizedBox(height: height * .02),
              FutureBuilder<List<JobAdvertisement>?>(
                future: _jobAdsController.getJob(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    printError(info: 'Error: ${snapshot.error}');
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('لا يوجد بيانات'));
                  }
                  List<JobAdvertisement> job = snapshot.data!;
                  return SizedBox(
                    height: height / 1,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildPopularJobs(
                            jobName: job[index].type,
                            salary: job[index].salary,
                            address: job[index].address,
                            caption: job[index].jobType,
                          );
                        },
                        itemCount: job.length),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
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

// CircleAvatar(
//     child: Container(
//       alignment: AlignmentDirectional.bottomEnd,
//       width: 10,
//       height: 10,
//       decoration: BoxDecoration(
//           color: Colors.red, borderRadius: BorderRadius.circular(20)),
//     ),
//     radius: width / 15,
//     backgroundImage:
//     AssetImage('assets/images/outBoarding_Images/out4.jpg')),
