import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/view/home_screens/home_widgets/buildPopularJobs.dart';
import 'package:job_app/view/requests_screen/request_widgets/requestCard.dart';

import 'courses_datiles.dart';

class AllCoursesScreen extends StatefulWidget {
  const AllCoursesScreen({super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('الدورات'),
        backgroundColor: Colors.transparent,

        elevation: 0,
      ),
      body:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return InkWell(
                  onTap: (){
                    Get.to(CourseDetailsPage());
                  },
                  child: RequestCard());
            },
            itemCount: 9),
      )
    );
  }
}
