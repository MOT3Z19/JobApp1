
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTypeController.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTimeController.dart';
import 'package:job_app/core/constansColor.dart';

import 'jobExpernce_screen.dart';

class JobTimeScreen extends StatefulWidget {
  final List<JobType> selectedJobTypes;
  JobTimeScreen({required this.selectedJobTypes});

  @override
  State<JobTimeScreen> createState() => _JobTimeScreenState();
}

class _JobTimeScreenState extends State<JobTimeScreen> {

  // Map<String, String> jobTimeImages = {
  //   'دوام كامل': 'assets/images/profile_icons/jobTime_icon/full.jpg',
  //   'دوام جزئي': 'assets/images/profile_icons/jobTime_icon/half.jpg',
  //   'عقد عمل': 'assets/images/profile_icons/jobTime_icon/face.jpg',
  //   'تدريب عملي': 'assets/images/profile_icons/jobTime_icon/work.jpg',
  //   'فريلانسر': 'assets/images/profile_icons/jobTime_icon/freelancer.jpg',
  //   'أعمال حرة': 'assets/images/profile_icons/jobTime_icon/others.jpg',
  // };
  final JobTimeController controller = Get.put(JobTimeController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.06;
    final double verticalPadding = screenWidth * 0.05;
    final double fontSizeSubtitle = screenWidth * 0.045;
    final double containerHeight = screenHeight * 0.08;
    final double buttonHeight = screenHeight * 0.07;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: screenWidth * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                'ما طبيعة الدوام الوظيفي التي تبحث عنه؟',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeTitle,
                ),
              ),

              Expanded(
                child: GetBuilder<JobTimeController>(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: controller.jobTimes.length,
                      itemBuilder: (context, index) {
                        JobTime jobTime = controller.jobTimes[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: verticalPadding),
                          child: Container(
                            height: screenHeight / 14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(12)),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      jobTime.imagePath??""),
                                  width: 32,
                                  height: 32,
                                ),
                                SizedBox(
                                  width: screenWidth * .03,
                                ),
                                Text(
                                  jobTime.name,
                                  style: TextStyle(fontSize: fontSizeSubtitle),
                                ),
                                Spacer(),
                                Checkbox(
                                  shape: CircleBorder(),
                                  value: jobTime.isSelected,
                                  activeColor: Color(0xFF5386E4),
                                  onChanged: (bool? value) {
                                    controller.toggleJobTimeSelection(
                                        index, value!);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final selectedJobTimes = controller.getSelectedJobTimes();

                  if (selectedJobTimes.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('يرجى اختيار وقت وظيفي واحد على الأقل!'),
                      ),
                    );
                  } else {
                    Get.to(() => ExperienceScreen(
                      selectedJobTypes: widget.selectedJobTypes,
                      selectedJobTimes: selectedJobTimes,
                    ));
                  }
                },
                child: Text(
                  'التالي',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF), fontSize: fontSizeSubtitle),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF356899),
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
    );
  }
}

