import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class RequestCard extends StatelessWidget {
  final String courseName;
  final String courseHours;
  final String coursePrice;
  final String courseDescription;
  const RequestCard({super.key, required this.courseName, required this.courseHours, required this.coursePrice, required this.courseDescription});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(

          padding: EdgeInsetsDirectional.symmetric(
              horizontal: width * .02, vertical: width * .02),
          margin: EdgeInsetsDirectional.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                child:Image.asset('assets/images/courses_icons/testImage.png') ,
                height: height/10,
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
                    ' ساعة $courseHours',
                    style: TextStyle(
                        fontSize: 13,
                        color: subsTitleColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    courseDescription,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Text(
                    '$coursePrice دينار ',
                    style: TextStyle(fontSize: 14, color: primaryColor),
                  ),

                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
