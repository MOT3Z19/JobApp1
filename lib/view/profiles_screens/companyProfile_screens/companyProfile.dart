import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/company/companyProfileController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/companyDataModels/companyProfile.dart';
import 'package:job_app/view/home_screens/home_widgets/buildPopularJobs.dart';

class CopmanyProfileScreen extends StatefulWidget {
  const CopmanyProfileScreen({super.key});

  @override
  State<CopmanyProfileScreen> createState() => _CopmanyProfileScreenState();
}

class _CopmanyProfileScreenState extends State<CopmanyProfileScreen> {
  final CompanyProfileController _companyProfileController = Get.put(
      CompanyProfileController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: CupertinoIconThemeData(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: FutureBuilder<ProfileCompany?>(
            future: _companyProfileController.fetchProfileCompany(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                printError(info:'Error: ${snapshot.error}');
                return Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData) {
                return Center(child: Text('لا يوجد بيانات'));
              }

              final profileCompany = snapshot.data!;
              return SingleChildScrollView( child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                        radius: width / 7,
                        backgroundImage:
                        NetworkImage(profileCompany.cvFileUrl??'')),
                  ),
                  SizedBox(height: height * .009),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(profileCompany.companyName??'',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/images/home_icons/drawer_icon/check.svg'),
                      Text(profileCompany.businessType??'',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: subsTitleColor)),
                      SizedBox(height: height * .009),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  Text('تاريخ تأسيس الشركة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: height * .01),
                  Container(
                    padding: EdgeInsets.all(width * .05),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              profileCompany.establishmentDate??'',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '${profileCompany.employeeCount??''} موظف ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: height * .01),
                        Text(
                          '${calculateYearsOfExcellence(profileCompany.establishmentDate??'' )}',
                          style: TextStyle(color: subsTitleColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * .01),
                  Text('عنوان الشركة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: height * .01),
                  Container(
                    padding: EdgeInsets.all(width * .05),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('العراق',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(
                          profileCompany.companyAddress??'',
                          style: TextStyle(color: subsTitleColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * .01),
                  Text('تعريف بالشركة',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: height * .01),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(width * .05),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text( profileCompany.companyDescription??''),),
                  SizedBox(height: height * .01),
                  Row(
                    children: [
                      Text(
                        'الوظائف المعروضة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      TextButton(
                          style: ButtonStyle(
                              alignment: AlignmentDirectional.centerEnd),
                          onPressed: () {},
                          child: Text('المزيد',
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF95969D)))),
                    ],
                  ),
                  // SizedBox(
                  //   height: height / 3,
                  //
                  //   child: ListView.builder(
                  //       physics: BouncingScrollPhysics(),
                  //       itemBuilder: (context, index) {
                  //         return buildPopularJobs();
                  //       },
                  //       itemCount: 9),
                  // ),
                ]));
            })

        )
    ,
    );

  }
  String calculateYearsOfExcellence(String establishmentDate) {
    DateTime establishedDate = DateFormat('yyyy-MM-dd').parse(establishmentDate);
    int yearsOfExcellence = DateTime.now().year - establishedDate.year;
    if (DateTime.now().month < establishedDate.month ||
        (DateTime.now().month == establishedDate.month && DateTime.now().day < establishedDate.day)) {
      yearsOfExcellence--;
    }
    return '$yearsOfExcellence عاماً من التميز والعطاء';
  }
}
