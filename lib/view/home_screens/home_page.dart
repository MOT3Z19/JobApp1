import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مرحبا بك',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          Row(
                            children: [
                              Text('محمود شاهين',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(width: 5),
                              Icon(Icons.waving_hand, color: Colors.orange),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsetsDirectional.only(end: 10),
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFE6E6E8)),
                          child: Center(
                              child: Image.asset('assets/images/filter.png')),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Almarai', fontSize: 15),
                          decoration: InputDecoration(
                            hintText: 'ابحث عن وظيفتك...',
                            suffixIcon: Image.asset('assets/images/search.png'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('أحدث الوظائف',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text('المزيد',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF95969D))))
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: PageView.builder(
                        controller: _controller,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return _buildJobCard(
                              'مدخل بيانات',
                              'شركة Shell plc',
                              'assets/images/logo.png',
                              '\$200-\$300',
                              'دوام كامل',
                              'العراق، بغداد، شارع المكتبة',
                              '2-3 سنوات خبرة');
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        width:
                            _currentPage == index ? width * 0.05 : width * 0.02,
                        height: height * 0.01,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Color(0xFF2B557C)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('أشهر الوظائف',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  _buildPopularJobs(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('أحدث الدورات',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text('المزيد',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF95969D))))
                    ],
                  ),
                  Container(
                    height: 300,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CourseCard(
                            title: 'برمجة',
                            description: 'دورة لتعليم اساسيات البرمجة...',
                            price: '\$500',
                            imageUrl:
                                'https://images.pexels.com/photos/4491461/pexels-photo-4491461.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard(String title, String company, String imageUrl,
      String salary, String type, String location, String experience) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Image.asset(
            'assets/images/Group_84.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 30, top: 10, end: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(imageUrl),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          company,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      backgroundColor: Colors.blueAccent.withOpacity(0.7),
                      label: Text(
                        experience,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Chip(
                      backgroundColor: Colors.blueAccent.withOpacity(0.7),
                      label: Text(
                        type,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'الراتب: $salary',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularJobs() {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(12),
          margin: EdgeInsetsDirectional.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'شيف طبخ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF0D0D26),
                    ),
                  ),
                  Text(
                    'مطعم المدينة',
                    style: TextStyle(fontSize: 14, color: Color(0xFF95969D)),
                  ),
                  Text(
                    'مفتوحة',
                    style: TextStyle(fontSize: 14, color: Color(0xFF95969D)),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الراتب:500\$',
                    style: TextStyle(fontSize: 14, color: Color(0xFF0D0D26)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'العراق.بغداد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF95969D),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.all(12),
          margin: EdgeInsetsDirectional.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'شيف طبخ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF0D0D26),
                    ),
                  ),
                  Text(
                    'مطعم المدينة',
                    style: TextStyle(fontSize: 14, color: Color(0xFF95969D)),
                  ),
                  Text(
                    'مفتوحة',
                    style: TextStyle(fontSize: 14, color: Color(0xFF95969D)),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الراتب:500\$',
                    style: TextStyle(fontSize: 14, color: Color(0xFF0D0D26)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'العراق.بغداد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF95969D),
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

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  CourseCard({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              width: 200,
              child: Image.network(imageUrl)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(price),
          ),
        ],
      ),
    );
  }
}
