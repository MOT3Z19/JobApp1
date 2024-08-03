import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Image
                  Image.asset('assets/images/conf.png', fit: BoxFit.cover,
                width: double.infinity,
                height: 200,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'دورة تدريب برمجة موبايل',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '10.5 ألف متعلم',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '\$500',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(width: 8),
                            Text('12 ساعة'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.check_circle),
                            SizedBox(width: 8),
                            Text('شهادة معتمدة'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.bar_chart),
                            SizedBox(width: 8),
                            Text('للمبتدئين'),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Course Description
                        Text(
                          'ماذا ستتعلم؟',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '...تم تصميم برنامج السياسات لتعلم Machine توفير أساس متين لتطبيقات ...',
                          style: TextStyle(fontSize: 16),
                        ),
                        // Join Button

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF356899),
                  minimumSize: Size(double.infinity, 65),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'تقديم طلب التحاق',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),


          ],
        ),
      ),
    );
  }
}
