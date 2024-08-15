import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 20,
      padding: EdgeInsetsDirectional.symmetric(vertical: height*.02),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: width/12,
              backgroundImage: AssetImage(
                  'assets/images/outBoarding_Images/out4.jpg')),
          SizedBox(height: height*.01),
          Text('ميسرة نصار',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  'assets/images/home_icons/drawer_icon/check.svg'),
              Text('UX/UI',style: TextStyle(color: subsTitleColor,fontSize: 13),),
            ],
          ),
        ],
      ),

    );
  }
}
