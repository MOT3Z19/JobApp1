import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_app/core/constansColor.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('تواصل معنا'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Icon(
                  Icons.zoom_in,
                  size:width/3,
                  color: primaryColor,
                )),
            SizedBox(height: height*.02),

            Center(child: Text('فُرصة',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: primaryColor),)),
            SizedBox(height: height*.06),
            Text('من نحن', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            SizedBox(height: height*.02),
            Container(
              padding: EdgeInsetsDirectional.all(width*.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color:Theme.of(context).primaryColor),
              child: Text(
                  'تطبيق فرصة هو منصة مبتكرة وحديثة تخدف الى تسهيل عملية التوظيف في العراق من خلال ربط الموظفين والاداريين والعمال بالشركات ورفدهم في السوق بطريقة سهلة وسريعة ومتطورة ، بالاضافة الى تأهيل وتدريب المستجدين في مجال الاعمال والسوق وتطوير الخبرات المحلية ، بالاضافة الى ذلك تقوم منصتنا بربط اصحاب المهن اليدوية وخبرات المستقلين بالزبائن والشركات التي تبحث عن مهن مستقلة او مؤقتة مثل المبرمجين والفنانين والرسامين والميكانيكين والكهربائيين وغيرهم .'),
            ),
            SizedBox(height: height*.02),

            Text('روابط التواصل', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            SizedBox(height: height*.02),

            Container(
              padding: EdgeInsetsDirectional.all(width*.08),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),color:Theme.of(context).primaryColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/contactLinks/Email.jpg',height: 30,width:30),
                  Image.asset('assets/images/contactLinks/LinkedIn.jpg',height: 30,width:30),
                  Image.asset('assets/images/contactLinks/Instagram.jpg',height: 30,width:30),
                  SvgPicture.asset('assets/images/contactLinks/whatsapp.svg',height: 30,width:30),
                  SvgPicture.asset('assets/images/contactLinks/facebook.svg',height: 30,width:30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
