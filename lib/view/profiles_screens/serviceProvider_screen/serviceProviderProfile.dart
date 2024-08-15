import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';

class ServiceProviderProfile extends StatefulWidget {
  const ServiceProviderProfile({super.key});

  @override
  State<ServiceProviderProfile> createState() => _ServiceProviderProfileState();
}

class _ServiceProviderProfileState extends State<ServiceProviderProfile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
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
                  NetworkImage('')),
            ),
            SizedBox(height: height * .009),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text('الخدمة المقدمة',
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
            Text('الخدمة المقدمة',
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
                        'تطوير برمجيات',
                        style: TextStyle(fontWeight: FontWeight.bold),

                      ),
                      Spacer(),
                      Text(
                        '20 ألف دينار',
                        style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor),
                      ),
                    ],
                  ),
                  Text(
                    'تطوير البرمجيات ويب وانظمة حاسوب ',
                    style: TextStyle(color: subsTitleColor),
                  ),
                  SizedBox(height: height * .01),

                ],
              ),
            ),
            SizedBox(height: height * .01),
            Text('عنوان مزود الخدمة',
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
            ElevatedButton(onPressed: (){}, child: Text('طلب خدمة'))
          ],),
        ),
      ),
    );
  }
}
