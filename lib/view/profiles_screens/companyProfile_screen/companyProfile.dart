import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/home_screens/home_widgets/buildPopularJobs.dart';
import 'package:job_app/view/requests_screen/request_widgets/requestCard.dart';

class CopmanyProfileScreen extends StatefulWidget {
  const CopmanyProfileScreen({super.key});

  @override
  State<CopmanyProfileScreen> createState() => _CopmanyProfileScreenState();
}

class _CopmanyProfileScreenState extends State<CopmanyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: CupertinoIconThemeData(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                    radius: width / 7,
                    backgroundImage:
                        AssetImage('assets/images/outBoarding_Images/out4.jpg')),
              ),
              SizedBox(height: height * .009),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text('شركة جوجل',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/images/home_icons/drawer_icon/check.svg'),
                  Text('تطوير برمجيات',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: subsTitleColor)),
                  SizedBox(height: height * .009),
                ],
              ),
              SizedBox(height: height * .02),
              Text('تعريف بالشركة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: height * .01),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * .05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                    'يتمتع مصمم Creative UX بخبرة تزيد عن 6 سنوات في تحسين تجربة المستخدم من خلال الحلول المبتكرة وتصميمات الواجهة الديناميكية. نجح في تعزيز تفاعل المستخدم مع العلامات التجارية المعروفة، مما يوفر تجربة مستخدم مقنعة لتحسين الولاء للعلامة التجارية والاحتفاظ بالعملاء.'),
              ),
              SizedBox(height: height * .01),
              Text('عنوان الشركة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: height * .01),
              Container(
                padding: EdgeInsets.all(width * .05),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('العراق',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(
                      'البصرة, شارع الحمرا , عمارة باشا, الطابق العاشر',
                      style: TextStyle(color: subsTitleColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .01),
              Text('تاريخ تأسيس الشركة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: height * .01),
              Container(
                padding: EdgeInsets.all(width * .05),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '20/06/2024 ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          '20 موظفاَ ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: height * .01),
                    Text(
                      '20 عاماً من التميز والعطاء',
                      style: TextStyle(color: subsTitleColor),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'وظائف الشركة',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                      style: ButtonStyle(
                          alignment: AlignmentDirectional.centerEnd),
                      onPressed: () {},
                      child: Text('المزيد',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xFF95969D)))),
                ],
              ),
              SizedBox(
                height: height/3,

                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return buildPopularJobs();
                    },
                    itemCount: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
