import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTypeController.dart';
import 'package:job_app/core/constansColor.dart';

import 'descrepation_screen.dart'; // Add this import for date formatting

class EducationScreen extends StatelessWidget {
  final List<JobType> selectedJobTypes;
  final List<String> selectedJobTimes;
  final String jobTitle;
  final String companyName;
  final String startDate;
  final String endDate;
  final String jobNature;

  EducationScreen({
    required this.selectedJobTypes,
    required this.selectedJobTimes,
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    required this.jobNature,
  });

  final TextEditingController universityController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController graduationDateController =
      TextEditingController();
  String? selectedDegree;

  void _navigateToNextScreen() {
    String university = universityController.text;
    String college = collegeController.text;
    String graduationDate = graduationDateController.text;
    String educationLevel = selectedDegree ?? '';

    if (university.isNotEmpty &&
        college.isNotEmpty &&
        graduationDate.isNotEmpty &&
        educationLevel.isNotEmpty) {

      Get.to(() => ProfileDataScreen(
            selectedJobTypes: selectedJobTypes,
            selectedJobTimes: selectedJobTimes,
            jobTitle: jobTitle,
            companyName: companyName,
            startDate: startDate,
            endDate: endDate,
            jobNature: jobNature,
            university: university,
            college: college,
            graduationDate: graduationDate,
            educationLevel: educationLevel,
          ));

    } else {
      Get.snackbar(
        'خطأ',
        'الرجاء تعبئة جميع الحقول',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.08;
    final double fontSizeSubtitle = screenWidth * 0.05;
    final double containerHeight = screenHeight * 0.15;
    final double buttonHeight = screenHeight * 0.07;
    final double horizontalPadding = screenWidth * 0.04;


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric( horizontal: horizontalPadding, vertical: screenWidth * 0.1),
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
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding * 2),
                    Text(
                      'التعليم',
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
                            labelText: 'آخر مؤهل علمي ',
                            border: InputBorder.none,
                          ),
                          items: [
                            'ثانوية عامة',
                            'دبلوم',
                            'بكالوريوس',
                            'ماجستير',
                            'دكتوراه'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(fontFamily: 'Almarai'),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedDegree = newValue;
                          },
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

                          controller: universityController,
                          decoration: InputDecoration(
                            hintText: 'الجامعة . . . ',
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

                          controller: collegeController,
                          decoration: InputDecoration(
                            hintText: 'الكلية',
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
                          controller: graduationDateController,
                          decoration: InputDecoration(
                            hintText: 'تاريخ التخرج . . . ',
                            border: InputBorder.none,
                          ),
                          readOnly: true,
                          onTap: () =>
                              _selectDate(context, graduationDateController),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Icon(Icons.add, color: Colors.black),
                        title: Text('أضف شهادات اخرى ',style: TextStyle(fontFamily:'Almarai'),),
                      ),
                    ),
                    SizedBox(height: screenHeight*.15),
                    ElevatedButton(
                      onPressed: _navigateToNextScreen,
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
