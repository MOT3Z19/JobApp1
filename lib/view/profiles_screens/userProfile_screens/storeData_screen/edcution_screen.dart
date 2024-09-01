import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_app/controller/firestoreController/user/jobTypeController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/usersDataModels/Edaction.dart';
import 'package:job_app/models/usersDataModels/ExperienceModel.dart';
import 'package:job_app/widgets/drop_TextFiledmenu_Widget.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';
import 'package:job_app/widgets/textfiled_date_widget.dart';
import 'descrepation_screen.dart'; // Add this import for date formatting

class EducationScreen extends StatefulWidget {
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

  EducationScreen({
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
  });

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final TextEditingController universityController = TextEditingController();

  final TextEditingController collegeController = TextEditingController();

  final TextEditingController graduationDateController =
  TextEditingController();

  String? selectedDegree;

  List<Edaction> eduction = [];

  void _addEdaction() {
    if (universityController.text.isNotEmpty &&
        collegeController.text.isNotEmpty &&
        graduationDateController.text.isNotEmpty &&
        selectedDegree.toString().isNotEmpty) {
      setState(() {
        eduction.add(
          Edaction(
            university: universityController.text,
            college: collegeController.text,
            graduationDate: graduationDateController.text,
            selectedDegree: selectedDegree.toString(),
          ),
        );
      });

      universityController.clear();
      collegeController.clear();
      graduationDateController.clear();
    } else {
      Get.snackbar(
        'خطأ',
        'الرجاء ملء جميع الحقول.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _navigateToNextScreen() {
    // if (eduction.isEmpty) {
    //   Get.snackbar(
    //     'خطأ',
    //     'الرجاء إضافة خبرات.',
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // }else{
      Get.to(() =>
          ProfileDataScreen(
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
            experiences: widget.experiences,
            edaction: eduction,
          ));
  //  }
  }

  // Future<void> _selectDate(BuildContext context,
  //     TextEditingController controller) async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (pickedDate != null) {
  //     controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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
                    onPressed: () {
                      _navigateToNextScreen();
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
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      'قم ببناء الملف الشخصي لك لتحصل على فرصة أكبر :)',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding * 2),
                    Text(
                      'التعليم',
                      style: TextStyle(
                          fontSize: fontSizeSubtitle,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding),
                    CustomDropdown(
                        label: 'آخر مؤهل علمي ',
                        onChanged: (String? newValue) {
                          selectedDegree = newValue;
                        },
                        options: [
                              'متوسط اعدادية',
                              'دبلوم',
                              'بكالوريوس',
                              'ماجستير',
                              'دكتوراة'
                        ],
                        selectedValue
                        :selectedDegree),
                    SizedBox(height: padding),
                    CustomTextField(label: 'الجامعة . . . ', controller:universityController,keybordType: TextInputType.text),
                    SizedBox(height: padding),
                    CustomTextField(label: 'الكلية. . .', controller:collegeController,keybordType: TextInputType.text),
                    SizedBox(height: padding),
                    CustomDatePicker(label: 'تاريخ التخرج . . . ', controller: graduationDateController),
                    SizedBox(height: padding),
                    InkWell(
                      onTap: () => _addEdaction(),
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text(
                          'أضف شهادات ودورات ',
                          style: TextStyle(fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight *.06),
                    ElevatedButton(
                      onPressed: _navigateToNextScreen,
                      child: Text(
                        'التالي',
                        style: TextStyle(
                            fontSize: fontSizeSubtitle),
                      ),
                      style: ElevatedButton.styleFrom(
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
