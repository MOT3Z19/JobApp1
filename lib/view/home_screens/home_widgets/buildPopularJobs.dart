import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constansColor.dart';

class buildPopularJobs extends StatelessWidget {
  final String jobName;
  final String salary;
  final String address;
  final String caption;
  const buildPopularJobs({super.key, required this.jobName, required this.salary, required this.address, required this.caption});

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
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 24,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: width * .03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobName??'',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF0D0D26),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    caption??'',
                    style: TextStyle(
                        fontSize: 14,
                        color: subsTitleColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    'مفتوحة',
                    style: TextStyle(
                        fontSize: 14,
                        color: subsTitleColor,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: width * .005,
                    child: IconButton(
                        onPressed: () {
                          print('object');
                        },
                        icon: Icon(
                          Icons.share,
                          size: 18,
                          color: Colors.black,
                        )),
                  ),
                  Text(
                    'الراتب:$salary\$',
                    style: TextStyle(fontSize: 14, color: primaryColor),
                  ),
                  Text(
                    address??'',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: subsTitleColor,
                    ),
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
