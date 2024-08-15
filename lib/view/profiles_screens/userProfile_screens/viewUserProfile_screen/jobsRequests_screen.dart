import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';

import '../../../home_screens/home_widgets/buildPopularJobs.dart';

class JobRequests extends StatefulWidget {
  const JobRequests({super.key});

  @override
  State<JobRequests> createState() => _JobRequestsState();
}

class _JobRequestsState extends State<JobRequests> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        leading:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/images/profile_icons/jobType_icon/add.svg'),
        ),
        // CircleAvatar(
        //     child: Container(
        //       alignment: AlignmentDirectional.bottomEnd,
        //       width: 10,
        //       height: 10,
        //       decoration: BoxDecoration(
        //           color: Colors.red, borderRadius: BorderRadius.circular(20)),
        //     ),
        //     radius: width / 15,
        //     backgroundImage:
        //     AssetImage('assets/images/outBoarding_Images/out4.jpg')),


        title: Text('الوظائف',

          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'ابحث عن وظيفة ...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: subsTitleColor
                    )
                  )
                ),
              ),
              SizedBox(height: height*.02),
              SizedBox(
                height: height/1,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return buildPopularJobs();
                    },
                    itemCount: 9),
              )


            ],
          ),
        ),
      ),
    );
  }
}
