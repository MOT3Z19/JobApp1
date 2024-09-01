import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/user/jobTypeController.dart';
import 'package:job_app/controller/firestoreController/user/userProfileController.dart';
import 'package:job_app/models/usersDataModels/Certificates.dart';
import 'package:job_app/models/usersDataModels/Edaction.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';
import '../../../../core/constansColor.dart';
import '../../../../models/usersDataModels/ExperienceModel.dart';
import '../../../../models/usersDataModels/UserProfileModel.dart';
import 'portofileScreen.dart';

class ProfileDataScreen extends StatefulWidget {
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
  final List<Edaction> edaction;


  ProfileDataScreen({
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
    required this.edaction,

  });

  @override
  State<ProfileDataScreen> createState() => _ProfileDataScreenState();
}

class _ProfileDataScreenState extends State<ProfileDataScreen> {
  final TextEditingController coursesNameController = TextEditingController();
  final TextEditingController coursesTypeController = TextEditingController();
  final TextEditingController coursesAgncyController = TextEditingController();
  final TextEditingController coursesTimeController = TextEditingController();
  final ProfileDataController controller = Get.put(ProfileDataController());

  List<Certificates> certificates = [];

  void _addCertificates() {
    if (coursesNameController.text.isNotEmpty &&
        coursesTypeController.text.isNotEmpty &&
        coursesAgncyController.text.isNotEmpty &&
        coursesTimeController.text.isNotEmpty) {
      setState(() {
        certificates.add(
          Certificates(
            coursesName: coursesNameController.text,
            coursesType: coursesTypeController.text,
            coursesAgncy: coursesAgncyController.text,
            coursesTime: coursesTimeController.text,
          ),
        );
      });

      // Clear the controllers after adding the experience
      coursesNameController.clear();
      coursesTypeController.clear();
      coursesAgncyController.clear();
      coursesTimeController.clear();
    } else {
      Get.snackbar(
        'خطأ',
        'الرجاء ملء جميع الحقول.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
    final double horizontalPadding = screenWidth * 0.04;
    final double buttonHeight = screenHeight * 0.07;

    File? cvFile;
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
                      Get.to(ProtofileScreen());
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
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: padding),
                    Text(
                      'الشهادات والدورات',
                      style: TextStyle(
                          fontSize: fontSizeSubtitle * 0.8,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding),
                    CustomTextField(label: 'اسم الدورة / الشهادة', controller:coursesNameController,keybordType: TextInputType.text),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFFFFFFFF),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: padding),
                    //     child: TextField(
                    //       style: TextStyle(fontFamily: 'Almarai'),
                    //       controller: coursesNameController,
                    //       decoration: InputDecoration(
                    //         hintText: 'اسم الدورة / الشهادة',
                    //         border: InputBorder.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: padding),
                    CustomTextField(label: 'الاختصاص', controller:coursesTypeController,keybordType: TextInputType.text),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFFFFFFFF),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: padding),
                    //     child: TextField(
                    //       style: TextStyle(fontFamily: 'Almarai'),
                    //       controller: coursesTypeController,
                    //       decoration: InputDecoration(
                    //         hintText: 'الاختصاص',
                    //         border: InputBorder.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: padding),
                    CustomTextField(label: 'الجهة المنفذة', controller:coursesAgncyController,keybordType: TextInputType.text),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFFFFFFFF),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: padding),
                    //     child: TextField(
                    //       style: TextStyle(fontFamily: 'Almarai'),
                    //       controller: coursesAgncyController,
                    //       decoration: InputDecoration(
                    //         hintText: 'الجهة المنفذة',
                    //         border: InputBorder.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: padding),
                    CustomTextField(label: 'مدة الدورة - بالأيام', controller:coursesTimeController,keybordType: TextInputType.text),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFFFFFFFF),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: padding),
                    //     child: TextField(
                    //       style: TextStyle(fontFamily: 'Almarai'),
                    //       controller: coursesTimeController,
                    //       decoration: InputDecoration(
                    //         hintText: 'مدة الدورة',
                    //         border: InputBorder.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: padding),

                    InkWell(
                      onTap: () => _addCertificates(),
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text('أضف شهادات ودورات اخرى ',
                            style: TextStyle(fontFamily: 'Almarai')),
                      ),
                    ),


                    SizedBox(height: screenHeight * .06),
                    ElevatedButton(
                        child: Text(
                          'التالي',
                          style: TextStyle(

                              fontSize: fontSizeSubtitle),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(double.infinity, buttonHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          Profile profile = Profile(
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
                              selectedJobTypes: widget.selectedJobTypes
                                  .map((type) => type.name)
                                  .toList(),
                              selectedJobTimes: widget.selectedJobTimes,
                              experiences: widget.experiences,
                            edaction: widget.edaction,
                            certificates: certificates,
                              portfolioImages: [],
                              profileImage: '',
                              cvText: '',
                              videoUrl: '',
                             );

                         await Get.find<ProfileDataController>().saveProfile(profile);
                          Get.to(ProtofileScreen());
                        }),
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