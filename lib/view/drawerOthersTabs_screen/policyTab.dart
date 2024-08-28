import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class PolicyTabScreen extends StatelessWidget {
  const PolicyTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text('سياسة الخصوصية'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('سياسة خصوصية المستخدمين',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: height*.04),
            Container(
              padding: EdgeInsetsDirectional.symmetric(vertical: height*.02,horizontal: width*.03),
              decoration: BoxDecoration(
                  color:Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
              ),
              width:width ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('المقدمة',style: TextStyle(fontSize: 14)),
                  SizedBox(height: height*.01),
                  Text('يهدف تطبيق "وظائف موظفين وشركات" إلى توفير منصة فعّالة لتواصل الباحثين عن العمل مع الشركات التي تسعى لتوظيف الكفاءات المناسبة. نحن ملتزمون بحماية خصوصيتك وضمان أمان بياناتك الشخصية. توضح هذه السياسة كيفية جمع، استخدام، ومشاركة المعلومات عند استخدامك لتطبيقنا.',style: TextStyle(color: subsTitleColor,fontSize: 13),),
                  SizedBox(height: height*.01),
                  Text('جمع المعلومات',style: TextStyle(fontSize: 14)),
                  SizedBox(height: height*.01),
                  Text('نقوم بجمع الأنواع التالية من المعلومات عند استخدامك للتطبيق:\nالمعلومات الشخصية\n- الاسم الكامل\n- عنوان البريد الإلكتروني\n- رقم الهاتف\n- السيرة الذاتية\n- المؤهلات الأكاديمية والخبرات المهنية',style: TextStyle(color: subsTitleColor,fontSize: 13),),
                  SizedBox(height: height*.01),
                  Text('المعلومات التقنية',style: TextStyle(fontSize: 14)),
                  SizedBox(height: height*.01),
                  Text('- عنوان IP \n- نوع الجهاز\n- نظام التشغيل\n- موقعك الجغرافي (بإذن منك)',style: TextStyle(color: subsTitleColor,fontSize: 13),),
                  SizedBox(height: height*.01),
                  Text('استخدام المعلومات',style: TextStyle(fontSize: 14)),
                  SizedBox(height: height*.01),
                  Text('نستخدم المعلومات التي نجمعها للأغراض التالية:\n-توفير وتحسين خدمات التطبيق\n- تسهيل عملية التوظيف من خلال التواصل بين الموظفين والشركات\n- تخصيص تجربتك على التطبيق\n- إرسال تحديثات وإشعارات متعلقة بفرص العمل والخدمات',style: TextStyle(color: subsTitleColor,fontSize: 13),),
                  SizedBox(height: height*.01),
                  Text('مشاركة المعلومات',style: TextStyle(fontSize: 14)),
                  SizedBox(height: height*.01),
                  Text('لن نشارك معلوماتك الشخصية مع جهات خارجية إلا في الحالات التالية:\n- بموافقتك الصريحة\n- مع شركات التوظيف التي تتعامل معنا\n- عند الضرورة للامتثال للقوانين واللوائح المعمول بها\n- لحماية حقوقنا وملكيتنا وسلامة مستخدمينا',style: TextStyle(color: subsTitleColor,fontSize: 13),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
