import 'package:flutter/material.dart';

class ProtofileScreen extends StatefulWidget {
  @override
  State<ProtofileScreen> createState() => _ProtofileScreenState();
}

class _ProtofileScreenState extends State<ProtofileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.08;
    final double fontSizeSubtitle = screenWidth * 0.04;
    final double containerHeight = screenHeight * 0.08;
    final double buttonHeight = screenHeight * 0.07;

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(padding),
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
                            color: Color(0xFF356899)),
                      ),
                    ),
                    Text(
                      'قم ببناء الملف الشخصي لك لتحصل على فرصة أكبر :)',
                      style:
                          TextStyle(fontSize: fontSizeSubtitle, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: padding),
                    Text(
                      'المرفقات',
                      style:
                          TextStyle(fontSize: fontSizeSubtitle, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        SizedBox(height: padding),
                        Container(
                          child: Center(child: Text('قم بارفاق صورة شخصية  . . . ',textAlign: TextAlign.center,)),
                          height: screenHeight * 0.29,
                          width: screenWidth * 0.29,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            border: Border.all(),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(height: fontSizeSubtitle),
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
                                  'قم بارفاق فيديو تعريفي خاص بك . . .  ',
                                  style: TextStyle(fontSize: fontSizeSubtitle),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: padding),
                                Text(
                                  'صيغ الملفات ,vedio ',
                                  style:
                                  TextStyle(fontSize: fontSizeSubtitle, color: Colors.grey),
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
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                  child: Text('حفظ السيرة الذاتية', style: TextStyle(color: Colors.white))),
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
