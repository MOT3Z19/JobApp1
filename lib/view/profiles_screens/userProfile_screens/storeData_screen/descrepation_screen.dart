import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/firestoreProfilesController.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTypeController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/usersDataModels/profileModel.dart';

import 'moreType_screen.dart';

class ProfileDataScreen extends StatelessWidget {
  final List<JobType> selectedJobTypes;
  final List<String> selectedJobTimes;
  final String jobTitle;
  final String companyName;
  final String startDate;
  final String endDate;
  final String jobNature;
  final String educationLevel;
  final String university;
  final String college;
  final String graduationDate;

  ProfileDataScreen({
    required this.selectedJobTypes,
    required this.selectedJobTimes,
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    required this.jobNature,
    required this.educationLevel,
    required this.university,
    required this.college,
    required this.graduationDate,
  });

  final TextEditingController briefDescriptionController =
      TextEditingController();

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
                    onPressed: () {},
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
                          fontSize: fontSizeSubtitle,
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
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'التحصيل الدراسي',
                            border: InputBorder.none,
                          ),
                          items: ['الثانوية', 'بكالوريس', 'ماجستير', 'دكتوراه']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontFamily: 'Almarai'),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Text(
                      'النبذة المختصرة',
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
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'النبذة المختصرة',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'قم برفع ملف السيرة الذاتية الخاص بك لتحصل على وظيفة مطابقة لعملك...',
                            style: TextStyle(fontSize: fontSizeSubtitle * 0.8),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: padding),
                          Text(
                            'صيغ الملفات DOC, pdf, word',
                            style: TextStyle(
                                fontSize: fontSizeSubtitle * 0.7,
                                color: Colors.grey),
                          ),
                          SizedBox(height: padding),
                          ElevatedButton(

                            onPressed: () async {},
                            child: Text(
                              'اختر من الملفات',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: Size(double.infinity, buttonHeight),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight*.15),
                    ElevatedButton(
                      child: Text(
                        'التالي',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF), fontSize: fontSizeSubtitle),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: Size(double.infinity, buttonHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        Get.to(MoretypeScreen());
                        if (cvFile != null) {
                          String cvFileUrl = await cvFile.path;
                          Profile profile = Profile(
                            selectedJobTypes:
                            selectedJobTypes.map((type) => type.name).toList(),
                            selectedJobTimes: selectedJobTimes,
                            jobTitle: jobTitle,
                            companyName: companyName,
                            startDate: startDate,
                            endDate: endDate,
                            jobNature: jobNature,
                            educationLevel: educationLevel,
                            university: university,
                            college: college,
                            graduationDate: graduationDate,
                            briefDescription: briefDescriptionController.text,
                            cvFileUrl: cvFileUrl,
                          );

                          Get.find<FirestoreController>().saveProfile(profile);


                        }
                      },


                    ),
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
