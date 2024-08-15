import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_app/core/constansColor.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/courses_icons/testImage.png',
            height: height / 3,
            width: width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .02),
                Row(
                  children: [
                    Text(
                      'دورة تدريب برمجة موبايل',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'أونلاين',
                      style: TextStyle(color: primaryColor),
                    ),
                    SizedBox(width: width * .02),
                    Text(
                      '20 ألف دينار',
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: height * .02),
                Text(
                  'بتاريخ 22/05/2024',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: height * .01),
                Text(
                  '152 متعلم',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                    height: height / 2.4,
                    width: width,
                    child: Column(
                      children: [
                        TabBar(
                          unselectedLabelColor: subsTitleColor,
                          labelColor: Colors.black,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              child: Text(
                                'تفاصيل الدورة',
                                style: TextStyle(
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'مواعيد الدورة',
                                style: TextStyle(
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'قائمة الفيديوهات',
                                style: TextStyle(
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                          indicatorColor: Colors.transparent,
                          onTap: (index) {
                            setState(() {}); // تحديث واجهة المستخدم عند التبديل
                          },
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/time.svg'),
                                      SizedBox(width: width * .02),
                                      Text('اجمالي عدد ساعات الدورة 12 ساعة'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/star.svg'),
                                      SizedBox(width: width * .02),
                                      Text('شهادة معتمدة'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/level.svg'),
                                      SizedBox(width: width * .02),
                                      Text('للمبتدئين'),
                                    ],
                                  ),
                                  Text('ماذا ستتعلم؟',
                                      style: TextStyle(fontSize: 15)),
                                  Text(
                                      'تم تصميم برنامج أساسيات تعلم Macine لتوفير أساس متين ومهارات جاهزة للعمل لمهندسي تعلم الآلة. تم تصميم برنامج أساسيات تعلم Macine لتوفيرج أساسيات تعلم Macine لتوفير أساس متين ومهارات جاهزة للعمل لمهندسي تعلم الآلة. اقرأ أكثر  أساس متين ومهارات جاهزة للعمل لمهندسي تعلم الآلة. اقرأ أكثر...',
                                      style: TextStyle(fontSize: 14)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/time.svg'),
                                      SizedBox(width: width * .02),
                                      Text('اجمالي عدد ساعات الدورة 12 ساعة'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/time.svg'),
                                      SizedBox(width: width * .02),
                                      Text('عدد الايام 3 أيام'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/time.svg'),
                                      SizedBox(width: width * .02),
                                      Text('4 ساعات يومياً'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/time.svg'),
                                      SizedBox(width: width * .02),
                                      Text('تاريخ البداية 22/05/2024'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/courses_icons/time.svg'),
                                      SizedBox(width: width * .02),
                                      Text('تاريخ النهاية 25/05/2024'),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: width * .02),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'القسم الأول',
                                          style: TextStyle(
                                              color: subsTitleColor,
                                              fontSize: 13),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {},
                                            icon:
                                                Icon(Icons.keyboard_arrow_down))
                                      ],
                                    ),
                                    Text(
                                      'قائمة تشغيل الدورة',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/courses_icons/play.svg'),
                                        SizedBox(width: width * .02),
                                        Text(
                                          'المحاضرة الاولى',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/courses_icons/play.svg'),
                                        SizedBox(width: width * .02),
                                        Text(
                                          'المحاضرة الاولى',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/courses_icons/play.svg'),
                                        SizedBox(width: width * .02),
                                        Text(
                                          'المحاضرة الاولى',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/courses_icons/play.svg'),
                                        SizedBox(width: width * .02),
                                        Text(
                                          'المحاضرة الاولى',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: height * .03),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'تقديم طلب التحاق',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
