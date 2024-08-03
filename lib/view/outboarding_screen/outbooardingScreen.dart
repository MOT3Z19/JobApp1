import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/auth_screen/sign_in_screen.dart';

class OutboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OutboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/outBoarding_Images/out1.jpg',
      'title': 'تصفح قائمة الوظائف',
      'subtitle':
          'تتضمن قائمة الوظائف لدينا العديد من الصناعات، حتى تتمكن من العثور على أفضل وظيفة لك.',
    },
    {
      'image': 'assets/images/outBoarding_Images/out2.jpg',
      'title': 'التقدم إلى أفضل الوظائف',
      'subtitle':
          'يمكنك التقديم على الوظائف المرغوبة لديك بسرعة وسهولة وبكل سهولة.',
    },
    {
      'image': 'assets/images/outBoarding_Images/out3.jpg',
      'title': 'أدر شركتك بشكل اسهل',
      'subtitle':
          'نحن نساعدك في العثور على موظفين أحلامك بناءً على متطلباتك وطلبك.',
    },
    {
      'image': 'assets/images/outBoarding_Images/out4.jpg',
      'title': 'طور مهاراتك الوظفية ',
      'subtitle':
          'طور نفسك بشكل سريع في مهاراتك وقدراتك من خلال الكورسات والتدريبات الملحقة لدينا',
    },
    {
      'image': 'assets/images/outBoarding_Images/out5.jpg',
      'title': 'انشئ سيرتك الذاتية',
      'subtitle': 'يمكنك إنشاء سيرة ذاتية لخبرات بسهولة وسرعة',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: ScrollPhysics(parent:BouncingScrollPhysics()),
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.09),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width / 1.6),
                            child: CircleAvatar(
                              backgroundColor: outBoardingColor,
                              radius: 15,
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              Container(
                                width: width / 1.4,
                                height: height / 2.9,
                                decoration: BoxDecoration(
                                  color: outBoardingColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(height / 2)),
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                    _onboardingData[index]['image']!,
                                    fit: BoxFit.cover),
                                clipBehavior: Clip.antiAlias,
                                width: width / 1.55,
                                height: height / 3.1,
                                decoration: BoxDecoration(
                                  color: outBoardingColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(height / 4)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        child: CircleAvatar(
                          backgroundColor: outBoardingColor,
                          radius: 20,
                        ),
                        alignment: AlignmentDirectional.bottomEnd,
                      ),
                      // Image.asset(
                      //   _onboardingData[index]['image']!,
                      //   width: width * 0.8,
                      //   height: height * 0.4,
                      // ),
                      SizedBox(height: height * 0.02),
                      Text(
                        _onboardingData[index]['title']!,
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.05),
                      Text(
                        _onboardingData[index]['subtitle']!,
                        style: TextStyle(
                          fontSize: height * 0.02,
                          color: Color(0xFF95969D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                width: _currentPage == index ? width * 0.05 : width * 0.02,
                height: height * 0.01,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index ? primaryColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingData.length - 1) {
                        Get.offAll(LoginScreen());
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? 'تسجيل الدخول'
                          : 'التالي',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(
                        _currentPage == 0 ? width * 0.1 : double.infinity,
                        height * 0.07,
                      ),
                    ),
                  ),
                ),
                if (_currentPage < _onboardingData.length - 1)
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsetsDirectional.only(start: width * 0.2),
                      child: TextButton(
                        onPressed: () {
                          _controller.jumpToPage(_onboardingData.length - 1);
                        },
                        child: Text(
                          'تخطي',
                          style: TextStyle(color: Color(0xFF95969D)),
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          ),
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
