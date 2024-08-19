import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/user_profile_controller.dart';
import '../../../../controller/firebaseControllers/user/jobTypeController.dart';
import '../../../../core/constansColor.dart';
import '../../../../models/usersDataModels/ExperienceModel.dart';
import '../../../../models/usersDataModels/UserProfileModel.dart';
import 'portofileScreen.dart';

class ProfileDataScreen extends StatelessWidget {
  final String fullname;
  final String bornPlace;
  final String bornDate;
  final String stutasMarr;
  final String phoneNumber;
  final String email;
  final String money;
  final String gender;
  final String OpentoWork;
  final String OntheWork;
  final String WorkPlace;
  final String Transfar;
  final String Language;
  final String Skills;
  final String showedProfile;
  final List<JobType> selectedJobTypes;
  final List<String> selectedJobTimes;
  final List<Experience> experiences;
  final String educationLevel;
  final String university;
  final String college;
  final String graduationDate;

  ProfileDataScreen({
    required this.fullname,
    required this.bornPlace,
    required this.bornDate,
    required this.stutasMarr,
    required this.phoneNumber,
    required this.email,
    required this.money,
    required this.gender,
    required this.OpentoWork,
    required this.OntheWork,
    required this.WorkPlace,
    required this.Transfar,
    required this.Language,
    required this.Skills,
    required this.showedProfile,
    required this.selectedJobTypes,
    required this.selectedJobTimes,
    required this.experiences,
    required this.educationLevel,
    required this.university,
    required this.college,
    required this.graduationDate,
  });

  final TextEditingController coursesNameController = TextEditingController();
  final TextEditingController coursesTypeController = TextEditingController();
  final TextEditingController coursesAgncyController = TextEditingController();
  final TextEditingController coursesTimeController = TextEditingController();

  final ProfileDataController controller = Get.put(ProfileDataController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.08;
    final double fontSizeSubtitle = screenWidth * 0.05;
    final double containerHeight = screenHeight * 0.15;
    final double horizontalPadding = screenWidth * 0.04;
    final double buttonHeight = screenHeight * 0.07;

    File? cvFile;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: screenWidth * 0.1),
        child: Column(
          children: [
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                    onPressed: () {
                      Get.to(ProtofileScreen());
                    },
                    child: Text(
                      textAlign: TextAlign.left,
                      'تخطي',
                      style: TextStyle(color: subsTitleColor),
                    ))),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'فرصة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeTitle,
                          color: Color(0xFF356899),
                        ),
                      ),
                    ),
                    Text(
                      'قم ببناء الملف الشخصي لك لتحصل على فرصة أكبر :)',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: padding),
                    Text(
                      'الشهادات والدورات',
                      style: TextStyle(
                          fontSize: fontSizeSubtitle * 0.8,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          style: TextStyle(fontFamily: 'Almarai'),
                          controller: coursesNameController,
                          decoration: InputDecoration(
                            hintText: 'اسم الدورة / الشهادة',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          style: TextStyle(fontFamily: 'Almarai'),
                          controller: coursesTypeController,
                          decoration: InputDecoration(
                            hintText: 'الاختصاص',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          style: TextStyle(fontFamily: 'Almarai'),
                          controller: coursesAgncyController,
                          decoration: InputDecoration(
                            hintText: 'الجهة المنفذة',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          style: TextStyle(fontFamily: 'Almarai'),
                          controller: coursesTimeController,
                          decoration: InputDecoration(
                            hintText: 'مدة الدورة',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),

                    InkWell(
                      onTap: () {
                      },
                      child: ListTile(
                        leading: Icon(Icons.add, color: Colors.black),
                        title: Text('أضف شهادات ودورات اخرى ',
                            style: TextStyle(fontFamily: 'Almarai')),
                      ),
                    ),


                    SizedBox(height: screenHeight * .15),
                    ElevatedButton(
                        child: Text(
                          'التالي',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: fontSizeSubtitle),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(double.infinity, buttonHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          Get.to(ProtofileScreen());
                          Profile profile = Profile(
                              fullname: fullname,
                              bornPlace: bornPlace,
                              bornDate: bornDate,
                              stutasMarr: stutasMarr,
                              phoneNumber: phoneNumber,
                              email: email,
                              money: money,
                              gender: gender,
                              OpentoWork: OpentoWork,
                              OntheWork: OntheWork,
                              WorkPlace: WorkPlace,
                              Transfar: Transfar,
                              Language: Language,
                              Skills: Skills,
                              showedProfile: showedProfile,
                              selectedJobTypes: selectedJobTypes
                                  .map((type) => type.name)
                                  .toList(),
                              selectedJobTimes: selectedJobTimes,
                              experiences: experiences,
                              educationLevel: educationLevel,
                              university: university,
                              college: college,
                              graduationDate: graduationDate,
                              nameCourse: coursesNameController.text,
                              timeCourse: coursesTimeController.text,
                              typeCourse: coursesTypeController.text,
                              AgnecyCoutse: coursesAgncyController.text,
                              evaluation: educationLevel,
                              portfolioImages: [],
                              profileImage: '',
                              cvText: '',
                              videoUrl: '');

                         await Get.find<ProfileDataController>().saveProfile(profile);

                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}