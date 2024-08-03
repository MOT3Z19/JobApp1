import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

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
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                child:Image.asset('assets/images/logo.png') ,
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
                    'برمجة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF0D0D26),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    '10.5 متعلم',
                    style: TextStyle(
                        fontSize: 13,
                        color: subsTitleColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    'مفتوحة',
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
                    '500\$',
                    style: TextStyle(fontSize: 14, color: primaryColor),
                  ),

                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: width * .02, vertical: width * .02),
          margin: EdgeInsetsDirectional.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                child:Image.asset('assets/images/logo.png') ,
                height: height/10,
                decoration: BoxDecoration(
                  color: Colors.cyan,
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
                    'برمجة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF0D0D26),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    '10.5 متعلم',
                    style: TextStyle(
                        fontSize: 13,
                        color: subsTitleColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    'مفتوحة',
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
                    '500\$',
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
