
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/jobTimeController.dart';
import 'package:job_app/core/constansColor.dart';

import '../../../../controller/firebaseControllers/user/jobTypeController.dart';
import 'jobExpernce_screen.dart';

class JobTimeScreen extends StatelessWidget {
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

  final JobTimeController jobTimeController = Get.put(JobTimeController());
  JobTimeScreen({
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
    required this.selectedJobTypes
  });
  void _goToNextPage(){
    final selectedJobTimes = controller.getSelectedJobTimes();
    Get.to(() => ExperienceScreen(
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
      selectedJobTypes: selectedJobTypes,
      selectedJobTimes: selectedJobTimes,
    ));
  }

  // Map<String, String> jobTimeImages = {
  final JobTimeController controller = Get.put(JobTimeController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.04;
    final double verticalPadding = screenWidth * 0.05;
    final double fontSizeSubtitle = screenWidth * 0.045;
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
                      onPressed: () {
                        _goToNextPage();
                      },
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
                'ما هو مدى تفرغك للعمل ؟',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
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
                                    controller.toggleJobTimeSelection(jobTime);
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
                  _goToNextPage();
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

