import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firebaseControllers/user/protofile_controller.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/profiles_screens/userProfile_screens/storeData_screen/moreTypeScreen.dart';

class ProtofileScreen extends StatefulWidget {
  @override
  State<ProtofileScreen> createState() => _ProtofileScreenState();
}

class _ProtofileScreenState extends State<ProtofileScreen> {
  final ProtofileController controller = Get.put(ProtofileController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.08;
    final double fontSizeSubtitle = screenWidth * 0.04;
    final double containerHeight = screenHeight * 0.08;
    final double horizontalPadding = screenWidth * 0.04;
    final double buttonHeight = screenHeight * 0.07;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              'قم ببناء الملف الشخصي لك لتحصل على فرصة أكبر :)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: screenHeight * .05),
            Text(
              'معرض الاعمال ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: screenHeight * .08),
                    DottedBorder(
                      color: primaryColor,
                      dashPattern: [8, 8, 8, 8],
                      borderPadding:
                          EdgeInsets.symmetric(horizontal: screenWidth * .03),
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20),
                      child: Container(
                        width: screenWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * .03,
                            vertical: screenHeight * .05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'قم برفع مجموعة من صور الاعمال \nالخاص بك لتحصل على وظيفة \nمطابقة لعملك . . . ',
                              style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  color: subsTitleColor),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(height: fontSizeSubtitle),
                            Container(
                              padding: EdgeInsetsDirectional.all(15),
                              width: screenWidth / 1.5,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                textAlign: TextAlign.center,
                                'صيغ الملفات  HEIF, JPG, PNG ',
                                style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * .08),
                            ElevatedButton(
                              onPressed: controller.selectImages,
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
                            Obx(() {
                              if (controller.selectedImages.isEmpty) {
                                return Text(
                                  'لم يتم اختيار ملفات بعد',
                                  style: TextStyle(fontSize: fontSizeSubtitle),
                                );
                              } else {
                                return Column(
                                  children:
                                      controller.selectedImages.map((file) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Image.file(
                                        file,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }).toList(),
                                );
                              }
                            }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight / 10),
                    ElevatedButton(
                      onPressed: () async {
                        Get.to(MoreTypeScreen());
                        await controller.uploadImages();
                      },
                      child: Center(
                        child: Text('التالي',
                            style: TextStyle(color: Colors.white)),
                      ),
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
