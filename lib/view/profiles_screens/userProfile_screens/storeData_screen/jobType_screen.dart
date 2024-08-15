
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTypeController.dart';

import '../../../../core/constansColor.dart';
import 'jobTime_screen.dart';

class JobTypeScreen extends StatelessWidget {
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
  JobTypeScreen({
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
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.04;
    final double verticalPadding = screenWidth * 0.05;
    final double fontSizeTitle = screenWidth * 0.06;
    final double fontSizeSubtitle = screenWidth * 0.045;
    final double containerHeight = screenHeight * 0.08;
    final double buttonHeight = screenHeight * 0.07;

    final JobTypeController controller = Get.put(JobTypeController());

    void _navigateToNextScreen() {
      List<JobType> selectedJobTypes =
          controller.jobTypes.where((jobType) => jobType.isSelected).toList();

      if (selectedJobTypes.isEmpty) {
        Get.snackbar(
          'خطأ',
          'الرجاء تعبئة جميع الحقول',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Navigate to the next screen and pass selected job types
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                JobTimeScreen(
                    fullname: fullname,
                    bornPlace: bornPlace,
                    bornDate: bornDate,
                    stutasMarr: stutasMarr,
                    phoneNumber: phoneNumber,
                    email: email,
                    money: money,
                    gender: gender,
                    OpentoWork: OpentoWork,
                    OntheWork: OntheWork,
                    WorkPlace: WorkPlace,
                    Transfar: Transfar,
                    Language: Language,
                    Skills: Skills,
                    showedProfile: showedProfile,
                    selectedJobTypes: selectedJobTypes)
            ,
          ),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: screenWidth * 0.1),
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
                    color:primaryColor,
                  ),
                ),
              ),
              Text(
                'ما القسم العام للوظيفة التي تريد البحث عنها؟',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeTitle,
                ),
              ),
              SizedBox(
                height: verticalPadding,
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.jobTypes.length,
                    itemBuilder: (context, index) {
                      final jobType = controller.jobTypes[index];
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
                                    jobType.icon??""),
                                width: 32,
                                height: 32,
                              ),
                              SizedBox(
                                width: screenWidth * .03,
                              ),
                              Text(
                                jobType.name,
                                style: TextStyle(fontSize: fontSizeSubtitle),
                              ),
                              Spacer(),
                              Checkbox(
                                shape: CircleBorder(),
                                value: jobType.isSelected,
                                activeColor: Color(0xFF5386E4),
                                onChanged: (bool? value) {
                                  controller.toggleJobTypeSelection(
                                      index, value!);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight*.05,
              ),
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
    );
  }
}
