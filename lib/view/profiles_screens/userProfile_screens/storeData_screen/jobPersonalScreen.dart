import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/jobType_screen.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';

import '../../../../widgets/drop_TextFiledmenu_Widget.dart';
import '../../../../widgets/textfiled_date_widget.dart';

class JobPersonalScreen extends StatefulWidget {
  @override
  _JobPersonalScreenState createState() => _JobPersonalScreenState();
}

class _JobPersonalScreenState extends State<JobPersonalScreen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController bornPlaceController = TextEditingController();
  final TextEditingController bornDateController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController salaryExpectationController = TextEditingController();

  String? selectedGender;
  String? selectedOpenToWork;
  String? selectedOtherCommitments;
  String? selectedWorkPlace;
  String? selectedTransport;
  String? selectedLanguage;
  String? selectedSkills;
  String? selectedProfileVisibility;

  void _navigateToNextScreen() {
    if (fullnameController.text.isNotEmpty) {
      Get.to(() => JobTypeScreen(
        fullname: fullnameController.text,
        bornPlace: bornPlaceController.text,
        bornDate: bornDateController.text,
        stutasMarr: maritalStatusController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
        money: salaryExpectationController.text,
        gender: selectedGender ?? '',
        OpentoWork: selectedOpenToWork ?? '',
        OntheWork: selectedOtherCommitments ?? '',
        WorkPlace: selectedWorkPlace ?? '',
        Transfar: selectedTransport ?? '',
        Language: selectedLanguage ?? '',
        Skills: selectedSkills ?? '',
        showedProfile: selectedProfileVisibility ?? '',
      ));
    } else {
      Get.snackbar(
        'Error',
        'Please fill in all required fields.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'تخطي',
                  style: TextStyle(color: subsTitleColor),
                ),
              ),
            ),
            Center(
              child: Text(
                'فرصة',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: primaryColor,
                ),
              ),
            ),
            Text(
              'قم ببناء الملف الشخصي لك لتحصل على فرصة أكبر :)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
            SizedBox(height: screenHeight*.02),
            Text('المعلومات الشخصية',style: TextStyle(fontWeight: FontWeight.bold),),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    CustomTextField(label: 'الاسم ثلاثي', controller: fullnameController),
                    CustomTextField(label: 'محل الولادة', controller: bornPlaceController),
                    CustomDatePicker(label: 'تاريخ الميلاد', controller: bornDateController),
                    CustomTextField(label: 'الحالة الزوجية', controller: maritalStatusController),
                    CustomTextField(label: 'رقم الهاتف', controller: phoneNumberController),
                    CustomTextField(label: 'البريد الالكتروني', controller: emailController),
                    CustomDropdown(
                      label: 'الجنس',
                      options: ['ذكر', 'انثى'],
                      selectedValue: selectedGender,
                      onChanged: (value) => setState(() => selectedGender = value),
                    ),
                    CustomDropdown(
                      label: 'هل انت متاح للعمل',
                      options: ['نعم', 'لا'],
                      selectedValue: selectedOpenToWork,
                      onChanged: (value) => setState(() => selectedOpenToWork = value),
                    ),
                    CustomDropdown(
                      label: 'هل لديك التزامات اخرى',
                      options: ['نعم', 'لا'],
                      selectedValue: selectedOtherCommitments,
                      onChanged: (value) => setState(() => selectedOtherCommitments = value),
                    ),
                    CustomDropdown(
                      label: 'متاح للعمل حضوريا او اونلاين',
                      options: ['حضوريا', 'اونلاين'],
                      selectedValue: selectedWorkPlace,
                      onChanged: (value) => setState(() => selectedWorkPlace = value),
                    ),
                    CustomTextField(label: 'اقل راتب تقبل به', controller: salaryExpectationController),
                    CustomDropdown(
                      label: 'هل تمتلك وسيلة نقل',
                      options: ['Yes', 'No'],
                      selectedValue: selectedTransport,
                      onChanged: (value) => setState(() => selectedTransport = value),
                    ),
                    CustomDropdown(
                      label: 'اللغات',
                      options: ['English', 'French', 'Arabic'],
                      selectedValue: selectedLanguage,
                      onChanged: (value) => setState(() => selectedLanguage = value),
                    ),
                    CustomDropdown(
                      label: 'المهارات',
                      options: ['English', 'French', 'Arabic'],
                      selectedValue: selectedSkills,
                      onChanged: (value) => setState(() => selectedSkills = value),
                    ),
                    CustomDropdown(
                      label: 'من يمكن رؤية ملفك الشخصي',
                      options: ['جميع رواد الاعمال واصحاب المشاريع', 'لا احد سوى الوضائف التي اتقدم عليها'],
                      selectedValue: selectedProfileVisibility,
                      onChanged: (value) => setState(() => selectedProfileVisibility = value),
                    ),
                    ElevatedButton(
                      onPressed: _navigateToNextScreen,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: Size(double.infinity, screenHeight * 0.07),
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
