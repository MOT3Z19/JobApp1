import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/home_screens/home_widgets/AllEmployeeCard.dart';

import '../home_widgets/employeeCard.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CircleAvatar(
                            child: Container(
                              alignment: AlignmentDirectional.bottomEnd,
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            radius: width / 13,
                            backgroundImage: AssetImage(
                                'assets/images/outBoarding_Images/out4.jpg')),
                      );
                    }),
                    SizedBox(
                      width: width * .03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('مرحبا بك',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Text('شركة تويتر 👋',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/images/home_icons/page_icons/notifcations.svg'))
                  ],
                ),
                SizedBox(height: height * .03),
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: width / 7,
                          height: height / 14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backSearchColor),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(CompanyHomeScreen());
                            },
                            icon: SvgPicture.asset(
                              'assets/images/home_icons/page_icons/filter.svg',
                              width: double.infinity,
                              height: double.infinity,
                            )),
                      ],
                    ),
                    SizedBox(width: width * .02),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: 'Almarai', fontSize: 15),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: backSearchColor,
                          hintText: 'ابحث عن موظفين . . .',
                          suffixIcon: SvgPicture.asset(
                            'assets/images/home_icons/page_icons/search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('أحدث الموظفين',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            alignment: AlignmentDirectional.centerEnd),
                        onPressed: () {},
                        child: Text('المزيد',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF95969D))))
                  ],
                ),
                SizedBox(
                  height: height/5.2,
                  child: GridView.builder(
                    shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          ),
                      itemCount: 4,

                      itemBuilder: (context, index) {

                        return EmployeeCard();
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                        (index) => Container(
                      margin: EdgeInsets.only(
                          left: width * .01,
                          right: width * .01,
                          top: width * .03),
                      width:
                      _currentPage == index ? width * 0.05 : width * 0.02,
                      height: height * 0.01,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? primaryColor
                            : subsTitleColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('جميع الموظفين',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            alignment: AlignmentDirectional.centerEnd),
                        onPressed: () {},
                        child: Text('المزيد',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF95969D))))
                  ],
                ),
                SizedBox(height: height/2,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return InkWell(
                            onTap: (){
                            },
                            child:AllEmployeeCard());
                      },
                      itemCount: 9),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
