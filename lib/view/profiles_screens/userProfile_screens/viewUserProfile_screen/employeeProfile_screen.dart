import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_app/controller/firebaseControllers/user/user_profile_controller.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/usersDataModels/UserProfileModel.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({super.key});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  final ProfileDataController _userProfileController = Get.put(
      ProfileDataController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        title: Text('الملف الشخصي'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Profile?>(
          future: _userProfileController.fetchProfile(),
          builder: (context, snapshot)  {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              printError(info:'Error: ${snapshot.error}');
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Center(child: Text('لا يوجد بيانات'));
            }
            final user = snapshot.data!;
            return
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: CircleAvatar(
                          radius: width / 7,
                          backgroundImage:NetworkImage(user.profileImage??'')),
                    ),
                    SizedBox(height: height * .009),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(user.fullname??'',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/images/home_icons/drawer_icon/check.svg'),
                        SizedBox(height: height * .009),
                        Text(user.selectedJobTypes.single[0],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: subsTitleColor)),
                      ],
                    ),
                    SizedBox(height: height * .01),
                    Text(
                      'المعلومات العامة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: height * .01),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.all(height * .02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              children: [
                                Text('الاسم :  '),
                                Text(
                                  user.fullname??'',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('تاريخ الميلاد :  '),
                                Text(
                                  user.bornDate??'',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('الإيميل :  '),
                                Text(
                                  user.email??'',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('الحالة الإجتماعية :  '),
                                Text(
                                  user.stutasMarr??'',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('العنوان :  '),
                                Text(
                                  user.bornPlace??'',
                                ),
                              ],
                            ),
                            SizedBox(height: height*.008),
                            // Row(
                            //   children: [
                            //     Text('مرفقات :  '),
                            //     SizedBox(
                            //       height: height/25,
                            //       child: ElevatedButton(
                            //         onPressed: () {},
                            //         child: Text('CV',style: TextStyle(fontSize: 10),),
                            //         style: ElevatedButton.styleFrom(
                            //
                            //             shape: RoundedRectangleBorder(
                            //                 borderRadius: BorderRadius.circular(10))),
                            //       ),
                            //     ),
                            //     SizedBox(width: width*.01),
                            //     SizedBox(
                            //       height: height/25,
                            //       child: ElevatedButton(
                            //         onPressed: () {},
                            //         child: Text('portofile',style: TextStyle(fontSize: 10),),
                            //         style: ElevatedButton.styleFrom(
                            //
                            //             shape: RoundedRectangleBorder(
                            //                 borderRadius: BorderRadius.circular(10))),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: height * .01),
                          ],
                        )),
                    Text(
                      'التعليم',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: height * .01),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.all(height * .02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(user.educationLevel??'',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Spacer(),
                                Text(
                                  user.university??'',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: height * .01),
                            Row(
                              children: [
                                Text(user.university??'',
                                    style: TextStyle(color: subsTitleColor)),
                                Spacer(),
                                Text(
                                  user.graduationDate??'',
                                  style: TextStyle(color: subsTitleColor),
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(height: height * .01),
                    Text(
                      'الخبرة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: height * .01),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.all(height * .02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('user.experiences[0].toString()',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Spacer(),
                                Text(
                                  '3 سنوات',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: height * .01),
                            Row(
                              children: [
                                Text('user.experiences[1].toString()',
                                    style: TextStyle(color: subsTitleColor)),
                                Spacer(),
                                Text(
                               ' user.experiences[2].toString()',
                                  style: TextStyle(color: subsTitleColor),
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(height: height * .01),
                    Text(
                      'النبذة المختصرة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: height * .01),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                            style: TextStyle(color: subsTitleColor),
                            user.cvText??'')),
                    SizedBox(height: height * .01),
                    Text(
                      'معرض الاعمال',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: height * .01),
                    Container(
                      height: width / 1.5,
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                             //عسثق child: Image.network(user.portfolioImages[index]),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan,
                              ),
                              width: width / 2.8,
                            );
                          }),
                    )
                  ],
                ),
              );

          },

        ),
      ),
    );
  }
}
