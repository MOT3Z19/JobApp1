import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class MoretypeScreen extends StatefulWidget {
  @override
  State<MoretypeScreen> createState() => _ProtofileScreenState();
}

class _ProtofileScreenState extends State<MoretypeScreen> {
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'فرصة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeTitle,
                            color: primaryColor),
                      ),
                    ),
                    Text(
                      'قم ببناء الملف الشخصي لك لتحصل على فرصة أكبر :)',
                      style: TextStyle(
                          fontSize: fontSizeSubtitle,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding),
                    Text(
                      'معرض الاعمال ',
                      style: TextStyle(
                          fontSize: fontSizeSubtitle,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(fontSizeSubtitle),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'قم برفع مجموعة من صور الاعمال الخاص بك لتحصل على وظيفة مطابقة لعملك . . . ',
                              style: TextStyle(fontSize: fontSizeSubtitle),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: fontSizeSubtitle),
                            Text(
                              'صيغ الملفات DOC, pdf, word',
                              style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: padding),
                            ElevatedButton(
                              onPressed: () {},
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
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                  child: Text('التالي', style: TextStyle(color: Colors.white))),
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
    );
  }
}
