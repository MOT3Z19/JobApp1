import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_screens/home_widgets/buildPopularJobs.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:
          CircleAvatar(
              child: Container(
                alignment: AlignmentDirectional.bottomEnd,
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
              ),
              radius: width / 15,
              backgroundImage:
              AssetImage('assets/images/outBoarding_Images/out4.jpg')),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )),
          ],
          centerTitle: true,
          title: Text('طلبات التوظيف',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai',
                  color: Colors.black),
              textAlign: TextAlign.center),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: height*.03),
              Text('20 طلب وظيفة لديك 👍',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height: height*.03),
              SizedBox(
                height: height/1.3,
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
