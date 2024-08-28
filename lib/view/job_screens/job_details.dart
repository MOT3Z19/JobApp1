import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_app/core/constansColor.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

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
                        backgroundColor: Colors.red,
                        // backgroundImage:
                        //     NetworkImage('profileCompany.cvFileUrl')
                      ),
                  ),
                  SizedBox(height: height * .02),
                  Text(
                    'مهندس حاسوب',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: height * .008),
                  Text(
                    'شركة فيسبوك',
                    style: TextStyle(color: subsTitleColor),
                  ),
                  SizedBox(height: height * .02),
                  Wrap(
                    spacing: width * .04,
                    children: [
                      Chip(
                        backgroundColor: submenueColor.withOpacity(1.0),
                        label: Text(
                          'قسم البرمجة',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Chip(
                        backgroundColor: submenueColor.withOpacity(1.0),
                        label: Text(
                          'خبرة 5 سنوات',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Chip(
                        backgroundColor: submenueColor.withOpacity(1.0),
                        label: Text(
                          'دوام جزئي',
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
                          'العراق,بغداد, شارع البصرة',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          ' الراتب 200\$-300\$',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Chip(
                      shape: RoundedRectangleBorder(
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
                        'متطلبات الوظيفة',
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
                        child: Text(
                          'نحن الفرق التي تنشئ جميع منتجات فيسبوك التي يستخدمها مليارات الأشخاص حول العالم. هل ترغب في إنشاء ميزات جديدة وتحسين المنتجات الحالية مثل Messenger والفيديو والمجموعات وآخر الأخبار والبحث والمزيد المسؤوليات:تطوير تطبيقات الويب/الهاتف المحمول بشكل كامل مع مجموعة متنوعة من لغات البرمجة إنشاء منتجات وميزات استهلاكية باستخدام لغة البرمجة الداخلية',

                              style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'درجة الماجستير في التصميم أو علوم الكمبيوتر أو التفاعل الحاسوبي أو مجال ذي صلة 3 سنوات من الخبرة الصناعية ذات الصلة.القدرة على قيادة المنتجات وتصميمها من الصفر وتحسين الميزات، كل ذلك من خلال عملية تصميم تتمحور حول المستخدم. مهارات في التواصل والتأثير على استراتيجية تصميم المنتج.مهارات ممتازة في حل المشكلات والإلمام بالقيود والقيود التقنية.تجربة التصميم عبر منصات متعددة.محفظة تسلط الضوء على مشاريع متعددة.',

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
