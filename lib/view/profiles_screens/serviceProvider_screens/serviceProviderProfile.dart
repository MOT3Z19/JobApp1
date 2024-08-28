import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/serviceProvider/serviceProviderProfileController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/service_profile/serviceProvider.dart';

class ServiceProviderProfile extends StatefulWidget {
   ServiceProviderProfile({super.key});

  @override
  State<ServiceProviderProfile> createState() => _ServiceProviderProfileState();
}
ServiceProviderProfileController _serviceFormController = Get.put(ServiceProviderProfileController());

class _ServiceProviderProfileState extends State<ServiceProviderProfile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('بروفايل مزود الخدمة'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05,vertical: height*.02),
        child: FutureBuilder<ServiceProfile?>(

          future:_serviceFormController.fetchServiceProfile(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              printError(info:'Error: ${snapshot.error}');
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Center(child: Text('لا يوجد بيانات'));
            }
            final serviceProvider = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                      radius: width / 7,
                      backgroundImage:
                      NetworkImage(serviceProvider.imageUrl)),
                ),
                SizedBox(height: height * .009),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(serviceProvider.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        'assets/images/home_icons/drawer_icon/check.svg'),
                    Text(serviceProvider.serviceType,
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
                           serviceProvider.serviceType,
                            style: TextStyle(fontWeight: FontWeight.bold),

                          ),
                          Spacer(),
                          Text(
                           '${serviceProvider.serviceFee} دينار ',
                            style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor),
                          ),
                        ],
                      ),
                      Text(
                        serviceProvider.serviceDescription,
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
                        serviceProvider.workLocation,
                        style: TextStyle(color: subsTitleColor),
                      ),
                    ],
                  ),
                ),
              ],);
          },

        ),
      ),
    );
  }
}
