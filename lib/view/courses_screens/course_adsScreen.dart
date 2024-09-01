import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/courses/courseAdsController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/widgets/drop_TextFiledmenu_Widget.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';

class CourseScreen extends StatefulWidget {
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final CourseAdsController controller = Get.put(CourseAdsController());

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
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02, horizontal: screenWidth * .03),
        child: SizedBox(
          height: screenHeight,
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
              'قم بالاعلان عن دورة او كورس تعليمي وتطويري :)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: screenHeight * .02),
            Text(
              'اعلان دورات وكورسات ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * .01),
            CustomTextField(
                label: 'اسم الدورة...',
                controller: controller.courseName,
                keybordType: TextInputType.text),
            CustomTextField(
                label: 'ساعات الدورة في اليوم...',
                controller: controller.courseHours,
                keybordType: TextInputType.number),
            CustomTextField(
                label: 'عدد الأيام...',
                controller: controller.courseDays,
                keybordType: TextInputType.number),
            SizedBox(height: screenHeight * .01),
            CustomDropdown(label: 'وجود شهادة معتمدة',options: ['يوجد', 'لايوجد'], selectedValue: controller.isCertified, onChanged: (value) => setState(() => controller.isCertified = value)),
            CustomDropdown(label: 'مستوى الدورة', options: ['مبتدأ', 'متوسط', 'متقدم'], selectedValue: controller.courseLevel, onChanged: (value) => setState(() => controller.courseLevel = value)),
            CustomDropdown(label: 'نوع الدورة', options: ['اونلاين', 'حضوري'], selectedValue: controller.courseType, onChanged: (value) => setState(() => controller.courseType = value)),
            CustomTextField(label: 'سعر الدورة...', controller: controller.coursePrice,keybordType: TextInputType.number),
            CustomTextField(label: 'مكان الدورة (البلد, المحافظة,المدينة)', controller: controller.courseLocation,keybordType: TextInputType.streetAddress),
            CustomTextField(label: 'إضافة فيديو مختصر عن الدورة', controller: controller.videoLink, keybordType: TextInputType.url),
            TextField(
              keyboardType: TextInputType.multiline, controller: controller.courseDescription, maxLines: 5,
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
                  hintText: 'اكتب النبذة المختصرة . . .'),
            ),
            SizedBox(height: screenHeight * .02),
            ElevatedButton(
              onPressed: (){
                List<Map<String, dynamic>> courses = [
                  {
                    'courseName': controller.courseName.text,
                    'courseHours': controller.courseHours.text,
                    'isCertified': controller.isCertified,
                    'courseLevel': controller.courseLevel,
                    'courseType': controller.courseType,
                    'courseDays': controller.courseDays.text,
                    'coursePrice': controller.coursePrice.text,
                    'courseLocation': controller.courseLocation.text,
                    'courseDescription': controller.courseDescription.text,
                    'videoLink': controller.videoLink.text,
                  }
                ];
                controller.addCoursesToDocument(courses);
                Get.back();

              },
              child: Text('اعلان'),
            ),
            SizedBox(height: screenHeight*.03),

          ],
        ))),
      ),
    );
  }
}
