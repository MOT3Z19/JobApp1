import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_app/core/constansColor.dart';

class JobScreen extends StatefulWidget {
  final String type;
  final String gender;
  final String experience;
  final String jobType;
  final String educationLevel;
  final String skills;
  final String employeeNum;
  final String address;
  final String workingHours;
  final String salary;
  final String companyName;
  final String companyImage;
  final String notes;
  const JobScreen({super.key, required this.type, required this.gender, required this.experience, required this.jobType, required this.educationLevel, required this.skills, required this.employeeNum, required this.address, required this.workingHours, required this.salary, required this.notes, required this.companyName, required this.companyImage});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen>with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
      super.initState();
      _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        actions: [Icon(Icons.share)],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height / 2,
                color: primaryColor,
              ),
              SvgPicture.asset(
                  'assets/images/home_icons/page_icons/mask_icons2.svg',
                  width: width,
                  fit: BoxFit.fill,
                  height: height / 2),
              Column(
                children: [
                  SizedBox(height: height / 9),
                  Center(
                    child: CircleAvatar(
                        radius: width / 7,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            NetworkImage(widget.companyImage)
                      ),
                  ),
                  SizedBox(height: height * .02),
                  Text(
                    widget.type,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: height * .008),
                  Text(
                    widget.companyName,
                    style: TextStyle(color: subsTitleColor),
                  ),
                  SizedBox(height: height * .02),
                  Wrap(
                    spacing: width * .04,
                    children: [
                      Chip(
                        backgroundColor: submenueColor.withOpacity(1.0),
                        label: Text(
                          '${widget.workingHours} ساعة ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Chip(
                        backgroundColor: submenueColor.withOpacity(1.0),
                        label: Text(
                         widget.gender,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Chip(
                        backgroundColor: submenueColor.withOpacity(1.0),
                        label: Text(
                          widget.jobType,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .008),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.address,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          ' الراتب ${widget.salary} \$',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Chip(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      backgroundColor: submenueColor.withOpacity(1.0),
                      label: Text(
                        'مفتوحة',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height/2.4,
            child: Column(
              children: [
                TabBar(
                  padding: EdgeInsetsDirectional.only(end: width/4),
                  unselectedLabelColor: subsTitleColor,
                  labelColor: Colors.black,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'وصف الوظيفة',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'ملاحظات',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {});  // تحديث واجهة المستخدم عند التبديل
                  },
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  عدد الموظفين المطلوب للوظيفة :  ${widget.employeeNum}',
                                  style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '  ساعات العمل :  ${widget.workingHours}',
                                  style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              ' المهارات المطلوبة : ${widget.skills}',
                                  style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              ' الجنس : ${widget.gender}',
                                  style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '  الراتب : ${widget.salary} \$',
                                  style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          widget.notes,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: width/25),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'تقديم طلب توظيف',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
