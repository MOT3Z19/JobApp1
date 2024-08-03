import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTypeController.dart';
import 'package:job_app/core/constansColor.dart';

import 'edcution_screen.dart'; // Add this import for date formatting

class ExperienceScreen extends StatelessWidget {
  final List<JobType> selectedJobTypes;
  final List<String> selectedJobTimes;

  ExperienceScreen({required this.selectedJobTypes, required this.selectedJobTimes});

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  String? selectedJobNature;

  void _navigateToNextScreen() {

    String jobTitle = jobTitleController.text;
    String companyName = companyNameController.text;
    String startDate = startDateController.text;
    String endDate = endDateController.text;
    String jobNature = selectedJobNature ?? '';
    if (jobTitle.isEmpty || companyName.isEmpty || startDate.isEmpty || endDate.isEmpty || jobNature.isEmpty) {
      Get.snackbar(
        'خطأ',
        'الرجاء تعبئة جميع الحقول',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.to(() => EducationScreen(
        selectedJobTypes: selectedJobTypes,
        selectedJobTimes: selectedJobTimes,
        jobTitle: jobTitle,
        companyName: companyName,
        startDate: startDate,
        endDate: endDate,
        jobNature: jobNature,
      ));
      print(selectedJobTypes[0]);

    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
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
    final double horizontalPadding = screenWidth * 0.04;
    final double buttonHeight = screenHeight * 0.07;

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
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.circular(15),
                        decoration: InputDecoration(
                          labelText: '  طبيعة الدوام . . . ',
                          border: InputBorder.none,
                        ),

                        items: ['فريلانسر', 'عقد عمل', 'دوام جزئي', 'دوام كامل',].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(fontSize: 17,fontFamily: 'Almarai'),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          selectedJobNature = newValue;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Icon(Icons.add, color: Colors.black),
                        title: Text('أضف خبرات اخرى ',style: TextStyle(fontFamily: 'Almarai')),
                      ),
                    ),
                    SizedBox(height: screenHeight*.09),
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
