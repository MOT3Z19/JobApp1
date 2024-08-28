import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/user/jobTypeController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/usersDataModels/ExperienceModel.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/edcution_screen.dart';

class ExperienceScreen extends StatefulWidget {
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

  ExperienceScreen({
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
  });

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  List<Experience> experiences = [];

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  void _addExperience() {
    if (jobTitleController.text.isNotEmpty &&
        companyNameController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      setState(() {
        experiences.add(
          Experience(
            jobTitle: jobTitleController.text,
            companyName: companyNameController.text,
            startDate: startDateController.text,
            endDate: endDateController.text,
          ),
        );
      });

      // Clear the controllers after adding the experience
      jobTitleController.clear();
      companyNameController.clear();
      startDateController.clear();
      endDateController.clear();
    } else {
      Get.snackbar(
        'خطأ',
        'الرجاء ملء جميع الحقول.',
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

  void _navigateToNextScreen() {
    if (experiences.isEmpty) {
      Get.snackbar(
        'خطأ',
        'الرجاء إضافة خبرات.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.to(() => EducationScreen(
        fullname: widget.fullname,
        bornPlace: widget.bornPlace,
        bornDate: widget.bornDate,
        stutasMarr: widget.stutasMarr,
        phoneNumber: widget.phoneNumber,
        email: widget.email,
        money: widget.money,
        gender: widget.gender,
        OpentoWork: widget.OpentoWork,
        OntheWork: widget.OntheWork,
        WorkPlace: widget.WorkPlace,
        Transfar: widget.Transfar,
        Language: widget.Language,
        Skills: widget.Skills,
        showedProfile: widget.showedProfile,
        selectedJobTypes: widget.selectedJobTypes,
        selectedJobTimes: widget.selectedJobTimes,
        experiences: experiences,
      ));
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: padding * 2),
                    Text(
                      'الخبرة',
                      style: TextStyle(
                        fontSize: fontSizeSubtitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: TextStyle(fontFamily: 'Almarai'),
                        controller: jobTitleController,
                        decoration: InputDecoration(
                          hintText: '  المسمى الوظيفي . . . ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: TextStyle(fontFamily: 'Almarai'),
                        controller: companyNameController,
                        decoration: InputDecoration(
                          hintText: '  اسم الشركة التي عملت بها . . . ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: TextStyle(fontFamily: 'Almarai'),
                        controller: startDateController,
                        decoration: InputDecoration(
                          hintText: '  تاريخ بدء العمل',
                          border: InputBorder.none,
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context, startDateController),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: TextStyle(fontFamily: 'Almarai'),
                        controller: endDateController,
                        decoration: InputDecoration(
                          hintText: '  تاريخ نهاية العمل',
                          border: InputBorder.none,
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context, endDateController),
                      ),
                    ),
                    SizedBox(height: padding),
                    InkWell(
                      onTap: _addExperience,
                      child: ListTile(
                        leading: Icon(Icons.add, color: Colors.black),
                        title: Text('أضف خبرات اخرى ',
                            style: TextStyle(fontFamily: 'Almarai')),
                      ),
                    ),
                    SizedBox(height: screenHeight * .09),
                    ElevatedButton(
                      onPressed: _navigateToNextScreen,
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
