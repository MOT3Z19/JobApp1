import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/moreProfileController.dart';
import 'package:job_app/core/constansColor.dart';

class MoreTypeScreen extends StatefulWidget {
  @override
  State<MoreTypeScreen> createState() => _ProtofileScreenState();
}

class _ProtofileScreenState extends State<MoreTypeScreen> {
  final MoreTypeController controller = Get.put(MoreTypeController());
  final TextEditingController cvTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.08;
    final double fontSizeSubtitle = screenWidth * 0.04;
    final double horizontalPadding = screenWidth * 0.04;
    final double buttonHeight = screenHeight * 0.07;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: screenHeight * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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
                fontSize: 22,
              ),
            ),
            SizedBox(height: screenHeight * .02),
            Text(
              'مرفقات ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: controller.uploadProfilePhoto,
                      child: Obx(() => DottedBorder(
                            color: primaryColor,
                            dashPattern: [8, 8, 8, 8],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(screenWidth * 0.60),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.60),
                                color: Colors.grey.shade100,
                              ),
                              height: screenHeight * 0.17,
                              width: screenWidth * 0.35,
                              child: Center(
                                  child: controller.profilePhotoUrl.isEmpty
                                      ? Text(
                                          'قم بارفاق صورة شخصية  . . . ',
                                          textAlign: TextAlign.center,
                                        )
                                      : Container(
                                          height: screenHeight * 0.29,
                                          width: screenWidth * 0.29,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                            border: Border.all(),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            controller.profilePhotoUrl.value,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                            ),
                          )),
                    ),
                    SizedBox(height: fontSizeSubtitle),
                    DottedBorder(
                      color: primaryColor,
                      dashPattern: [8, 8, 8, 8],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(15),
                      child: Container(
                        width: screenWidth,
                        padding: EdgeInsets.all(fontSizeSubtitle),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'قم بارفاق فيديو تعريفي خاص بك . . .  ',
                              style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  color: subsTitleColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: padding),
                            Container(
                              padding: EdgeInsetsDirectional.all(15),
                              width: screenWidth / 1.5,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                textAlign: TextAlign.center,
                                'صيغ الملفات  Video,MP4 ',
                                style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            ElevatedButton(
                              onPressed: controller.uploadVideo,
                              child: Text(
                                'اختر من الملفات',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: fontSizeSubtitle),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: cvTextController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(top: screenHeight*.13,start: screenWidth*.05),
                            child: SvgPicture.asset('assets/images/profile_icons/about.svg')),
                          fillColor: Colors.white,
                          filled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'اكتب النبذة المختصرة . . .'),
                    ),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String uid = FirebaseAuth.instance.currentUser!.uid;

                        await FirebaseFirestore.instance
                            .collection('profiles_User')
                            .doc(uid)
                            .update(
                          {
                            'cvText': cvTextController.text,
                          },
                        );
                      },
                      child: Center(
                          child: Text('حفظ السيرة الذاتية',
                              style: TextStyle(color: Colors.white))),
                      style: ElevatedButton.styleFrom(
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
