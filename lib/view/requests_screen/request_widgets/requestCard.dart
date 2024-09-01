import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class RequestCard extends StatelessWidget {
  final String courseName;
  final String courseHours;
  final String courseType;
  final String courseAddress;
  const RequestCard({super.key, required this.courseName, required this.courseHours, required this.courseType, required this.courseAddress});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsetsDirectional.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child:Image.asset('assets/images/courses_icons/courseBackground.jfif',fit: BoxFit.fill,) ,
                height: height/8,
                width: width/4,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),

              SizedBox(
                width: width * .03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   courseName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    '$courseHours  ساعات يومياَ ',
                    style: TextStyle(
                        fontSize: 13,
                        color: subsTitleColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    courseAddress,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Spacer(),
              Text(
                '$courseType',
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
              SizedBox(width: width*.03,)

            ],
          ),
        ),

      ],
    );
  }
}
