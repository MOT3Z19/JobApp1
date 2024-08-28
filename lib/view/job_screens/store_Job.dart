import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/jobs/JobAdsController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/home_screens/UserHome/bottomBar.dart';
import 'package:job_app/widgets/drop_TextFiledmenu_Widget.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';

class JobAdvertisementScreen extends StatefulWidget {
  @override
  State<JobAdvertisementScreen> createState() => _JobAdvertisementScreenState();
}

class _JobAdvertisementScreenState extends State<JobAdvertisementScreen> {
  final JobAdsController controller = Get.put(JobAdsController());

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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'رجوع',
                style: TextStyle(color: subsTitleColor),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02,horizontal:screenWidth*.03 ),
        child: Expanded(
          child: SingleChildScrollView(
             physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            padding: EdgeInsetsDirectional.symmetric(vertical: screenHeight*.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:screenHeight*.07),
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
                  'قم بالاعلان عن وظيفة واختر افضل المقدمين لشركتك :)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: screenHeight * .02),
                Text(
                  'إعلان توظيف',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight*.01),
                CustomDropdown(
                    label: 'التخصص',
                    options: [
                      'مهندس',
                      'مشرف عمل',
                      'مسؤل سلامة',
                      'مدير',
                      'مدير إداري',
                      'مدبر مشروع',
                      'مديرحسابات',
                      'محاسب',
                      'مدقق',
                      'مدير تنفيذي',
                      'مدير مبيعات',
                      'مسؤل مبيعات',
                      'كاشير',
                      'موظف امن',
                      'حارس',
                      'عامل',
                      'إعلامي',
                      'بلوغر',
                      'مدير سوشال ميديا',
                      'مبرمج',
                      '',
                      'مصمم',
                      'مترجم',
                      'عارض ازياء',
                      'كابتن صالة',
                      'موظف خدمات',
                      'صيدلاني',
                      'دكتور',
                      'بيطري',
                      'مهندس زراعي',
                      'مهندس معماري',
                      'مهندس ميكانيكي',
                      'مهندس كهربائي',
                      'مهندس مدني',
                      'مدير موارد بشرية',
                      'موظف موارد بشرية',
                      'مدخل بيانات',
                    ],
                    selectedValue: controller.type,
                    onChanged: (value) =>
                        setState(() => controller.type = value)),
                CustomDropdown(
                    label: 'الجنس',
                    options: ['ذكر', 'انثى'],
                    selectedValue: controller.gender,
                    onChanged: (value) =>
                        setState(() => controller.gender = value)),
                CustomDropdown(
                    label: 'مستوى التعليم المطلوب',
                    options: [
                      'متوسط اعدادية',
                      'دبلوم',
                      'بكالوريوس',
                      'ماجستير',
                      'دكتوراة'
                    ],
                    selectedValue: controller.educationLevel,
                    onChanged: (value) =>
                        setState(() => controller.educationLevel = value)),
                CustomDropdown(
                    label: 'نوع العمل',
                    options: [
                      'حضوري',
                      'أونلاين',
                      'كلاهما',
                    ],
                    selectedValue: controller.jobType,
                    onChanged: (value) =>
                        setState(() => controller.jobType = value)),
                CustomDropdown(
                    label: 'المهارات المطلوبة . . . ',
                    options: [
                      'العمل الجماعي',
                      'التعامل مع الزبائن',
                      'التسويق',
                      'الحسابات'
                    ],
                    selectedValue: controller.skills,
                    onChanged: (value) =>
                        setState(() => controller.skills = value)),
                CustomTextField(
                  label: 'الخبرة-> مثال:غير مطلوبة / 1-4 سنوات.',
                  controller: controller.experience,
                  keybordType: TextInputType.text,),
                CustomTextField(label: ' العدد المطلوب . . .',
                  controller: controller.employeeNum,
                  keybordType: TextInputType.number,),
                CustomTextField(label: 'العنوان . . . ',
                  controller: controller.address,
                  keybordType: TextInputType.text,),
                CustomTextField(label: 'ساعات العمل . . . ',
                  controller: controller.workingHours,
                  keybordType: TextInputType.text,),
                CustomTextField(label: 'متوسط الراتب . . . ',
                  controller: controller.salary,
                  keybordType: TextInputType.text,),
                TextField(
                  keyboardType: TextInputType.multiline, controller: controller.notes, maxLines: 5,
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).primaryColor,
                      filled: true,
                      suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenHeight * .13,
                              start: screenWidth * .05),
                          child: SvgPicture.asset(
                              'assets/images/profile_icons/about.svg')),
                      border: OutlineInputBorder( // استخدام OutlineInputBorder للحواف الدائري// ة
                          borderRadius: BorderRadius.circular(10), // إضافة الحواف الدائرية
                          borderSide: BorderSide.none,
                          gapPadding: 12// إزالة الحد الخارجي
                      ),
                      hintText: 'ملاحظات . . .'),
                ),
                SizedBox(height: screenHeight*.02),
                ElevatedButton(onPressed: () {
                  List<Map<String, dynamic>> jobs = [
                    {
                      'specialization': controller.type,
                      'gender': controller.gender,
                      'educationLevel': controller.educationLevel,
                      'jobType': controller.jobType,
                      'skills': controller.skills,
                      'experience': controller.experience.text,
                      'employeeNum': controller.employeeNum.text,
                      'address': controller.address.text,
                      'workingHours': controller.workingHours.text,
                      'salary': controller.salary.text,
                      'notes': controller.notes.text,
                    }
                  ];
                  controller.addCoursesToDocument(jobs);
                  Get.to(MyHomePage());
                 // controller.submitForm();
                }, child: Text('إعلان'))
              ],
            ),
          ),
        ),
      ),
    );
  }

}
