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
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController salaryExpectationController = TextEditingController();
  String? selectedGender;
  String? maritalStatus;
  String? selectedOpenToWork;
  String? selectedOtherCommitments;
  String? selectedWorkPlace;
  String? selectedTransport;
  String? selectedLanguage;
  String? selectedSkills;
  String? selectedProfileVisibility;

  void _navigateToNextScreen() {
      Get.to(() => JobTypeScreen(
        fullname: fullnameController.text,
        bornPlace: bornPlaceController.text,
        bornDate: bornDateController.text,
        stutasMarr: maritalStatus??'',
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

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                _navigateToNextScreen();
              },
              child: Text(
                'تخطي',
                style: TextStyle(color: subsTitleColor),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenWidth * 0.07),
        child: Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*.07),
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
                SizedBox(height: screenHeight*.01),
                CustomDropdown(

                  label: 'من يمكن رؤية ملفك الشخصي',
                  options: ['جميع رواد الاعمال واصحاب المشاريع', 'لا احد سوى الوظائف التي اتقدم عليها'],
                  selectedValue: selectedProfileVisibility,
                  onChanged: (value) => setState(() => selectedProfileVisibility = value),
                ),
                CustomTextField(label: 'الاسم ثلاثي', controller: fullnameController,keybordType: TextInputType.name),
                CustomTextField(label: 'محل الولادة', controller: bornPlaceController,keybordType: TextInputType.streetAddress),
                CustomDatePicker(label: 'تاريخ الميلاد', controller: bornDateController),
                SizedBox(height: screenHeight*.01),
                CustomDropdown(
                  label: 'الحالة الزوجية',
                  options: ['أعزب', 'متزوج','منفصل'],
                  selectedValue: maritalStatus,
                  onChanged: (value) => setState(() => maritalStatus = value),
                ),
               // CustomTextField(label: 'الحالة الزوجية', controller: maritalStatusController),
                CustomTextField(label: 'رقم الهاتف', controller: phoneNumberController,keybordType: TextInputType.phone),
                CustomTextField(label: 'البريد الالكتروني', controller: emailController,keybordType: TextInputType.emailAddress),
                SizedBox(height: screenHeight*.01),
                CustomDropdown(
                  label: 'الجنس',
                  options: ['ذكر', 'انثى'],
                  selectedValue: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                CustomDropdown(

                  label: ' هل انت متاح للعمل الان',
                  options: ['نعم يمكنني البدء فوراً', 'لا سوف اتفرغ خلال فترة قصيرة'],

                  selectedValue: selectedOpenToWork,
                  onChanged: (value) => setState(() => selectedOpenToWork = value),
                ),
                CustomDropdown(
                  label: 'هل لديك التزامات اخرى ؟',
                  options: ['متفرغ كلياً', 'متفرغ جزئياً'],
                  selectedValue: selectedOtherCommitments,
                  onChanged: (value) => setState(() => selectedOtherCommitments = value),
                ),
                CustomDropdown(
                  label: 'متاح للعمل حضوريا او اونلاين',
                  options: ['حضوري و أونلاين','حضورياً', 'اونلاين'],
                  selectedValue: selectedWorkPlace,
                  onChanged: (value) => setState(() => selectedWorkPlace = value),
                ),
                CustomTextField(label: 'اقل راتب تقبل به - >     مثال : 400\$ فصاعدا', controller: salaryExpectationController,keybordType: TextInputType.text),
                SizedBox(height: screenHeight*.01),

                CustomDropdown(
                  label: 'هل تمتلك وسيلة نقل',
                  options: ['نعم', 'لا'],
                  selectedValue: selectedTransport,
                  onChanged: (value) => setState(() => selectedTransport = value),
                ),
                CustomDropdown(
                  label: 'اللغات',
                  options: ['العربية', 'الإنجليزية', 'الفرنسية','الإيطالية','الأسبانية','التركية','الهندية','الصينية'],
                  selectedValue: selectedLanguage,
                  onChanged: (value) => setState(() => selectedLanguage = value),
                ),
                CustomDropdown(
                  label: 'المهارات',
                  options: ['العمل الجماعي', 'التعامل مع الزبائن', 'التسويق','الحسابات'],
                  selectedValue: selectedSkills,
                  onChanged: (value) => setState(() => selectedSkills = value),
                ),
               
                SizedBox(height: screenHeight*.02),

                ElevatedButton(
                  onPressed: _navigateToNextScreen,
                  child: Text(
                    'التالي',
                    style: TextStyle(
                      color: Colors.white,

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
      ),
    );
  }
}
