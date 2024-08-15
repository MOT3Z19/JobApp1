import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';

class EmployeeProfileEdit extends StatefulWidget {
  const EmployeeProfileEdit({super.key});

  @override
  State<EmployeeProfileEdit> createState() => _EmployeeProfileEditState();
}

class _EmployeeProfileEditState extends State<EmployeeProfileEdit> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصي'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: CircleAvatar(
                    radius: width / 7,
                    backgroundImage: AssetImage(
                        'assets/images/outBoarding_Images/out4.jpg')),
              ),
              SizedBox(height: height * .009),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text('ميسرة نصار',
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
                  Text('مطور تطبيقات',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: subsTitleColor)),
                ],
              ),
              SizedBox(height: height * .01),
              Row(
                children: [
                  Text(
                    'المعلومات العامة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'تعديل',
                        style: TextStyle(color: primaryColor),
                      ))
                ],
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
                            'ميسرة علي نصار',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('تاريخ الميلاد :  '),
                          Text(
                            '8/7/2001',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('الإيميل :  '),
                          Text(
                            'maysaranasser8@gmail.com',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('الحالة الإجتماعية :  '),
                          Text(
                            'أعزب',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('العنوان :  '),
                          Text(
                            'فلسطين , شارع العز',
                          ),
                        ],
                      ),
                      SizedBox(height: height * .008),
                      Row(
                        children: [
                          Text('مرفقات :  '),
                          SizedBox(
                            height: height / 25,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'CV',
                                style: TextStyle(fontSize: 10),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(width: width * .01),
                          SizedBox(
                            height: height / 25,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'portofile',
                                style: TextStyle(fontSize: 10),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * .01),
                    ],
                  )),
              Row(
                children: [
                  Text(
                    'التعليم',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'تعديل',
                        style: TextStyle(color: primaryColor),
                      ))
                ],
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
                          Text('بكالوريا علوم حاسوب',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(
                            'قسم الحوسبة',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: height * .01),
                      Row(
                        children: [
                          Text('جامعة القدس المفتوحة',
                              style: TextStyle(color: subsTitleColor)),
                          Spacer(),
                          Text(
                            '06/2024',
                            style: TextStyle(color: subsTitleColor),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: height * .01),
              Row(
                children: [
                  Text(
                    'الخبرة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'تعديل',
                        style: TextStyle(color: primaryColor),
                      ))
                ],
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
                          Text('مطور تطبيقات',
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
                          Text('شركة نيو-واي',
                              style: TextStyle(color: subsTitleColor)),
                          Spacer(),
                          Text(
                            'دوام كامل',
                            style: TextStyle(color: subsTitleColor),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: height * .01),
              Row(
                children: [
                  Text(
                    'النبذة المختصرة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'تعديل',
                        style: TextStyle(color: primaryColor),
                      ))
                ],
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
                      'يتمتع مصمم Creative UX بخبرة تزيد عن 6 سنوات في تحسين تجربة المستخدم من خلال الحلول المبتكرة وتصميمات الواجهة الديناميكية. نجح في تعزيز تفاعل المستخدم مع العلامات التجارية المعروفة، مما يوفر تجربة مستخدم مقنعة لتحسين الولاء للعلامة التجارية والاحتفاظ بالعملاء.')),
              SizedBox(height: height * .01),
              Row(
                children: [
                  Text(
                    'معرض الاعمال',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'تعديل',
                        style: TextStyle(color: primaryColor),
                      ))
                ],
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
        ),
      ),
    );
  }
}
