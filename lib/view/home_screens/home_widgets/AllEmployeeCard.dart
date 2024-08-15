import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class AllEmployeeCard extends StatelessWidget {
  const AllEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: height*.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: height/8,
            child:Image.asset('assets/images/logo.png') ,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(width: width*.02),
          Align(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                children: [
                  Text('ميسرة نصار',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  SizedBox(width: width/5),
                  Text('خبرة 5 سنوات',style: TextStyle(fontSize: 13),),
                ],
              ),
                SizedBox(height: height*.009),
                Text('مبرمج أندرويد',style: TextStyle(fontSize: 14,color: subsTitleColor),),
                SizedBox(height: height*.007),
                SizedBox(
                    width: width/1.6,
                    child: Text(maxLines: 2,'يتمتع مصمم Creative UX بخبرة تزيد عن 6 سنوات في تحسين تجربة المستخدم من خلال الحلول المبتكرة وتصميمات الواجهة الديناميكية .  .  .'))

            ],),
          )


        ],
      ),
    );
  }
}
