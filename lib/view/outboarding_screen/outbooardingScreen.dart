import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/out_1.png',
      'title': 'تصفح قائمة الوظائف',
      'subtitle': 'تتضمن قائمة الوظائف لدينا العديد من الصناعات، حتى تتمكن من العثور على أفضل وظيفة لك.',
    },
    {
      'image': 'assets/images/out_2.png',
      'title': 'التقدم إلى أفضل الوظائف',
      'subtitle': 'يمكنك التقديم على الوظائف المرغوبة لديك بسرعة وسهولة وبكل سهولة.',
    },
    {
      'image': 'assets/images/out_3.png',
      'title': 'اجعل حياتك المهنية',
      'subtitle': 'نحن نساعدك في العثور على موظفين أحلامك بناءً على متطلباتك وطلبك.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.2,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(777),
                bottomStart: Radius.circular(777),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _onboardingData[index]['image']!,
                        width: width * 0.8,
                        height: height * 0.4,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        _onboardingData[index]['title']!,
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.01),
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
                  color: _currentPage == index
                      ? Color(0xFF2B557C)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (_currentPage < _onboardingData.length - 1)
                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(_onboardingData.length - 1);
                    },
                    child: Text(
                      'تخطي',
                      style: TextStyle(color: Color(0xFF95969D)),
                    ),
                  ),
                Expanded(

                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingData.length - 1) {
                        Navigator.pushReplacementNamed(context, '/log_in');
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
                      backgroundColor: Color(0xFF2C557D),
                      minimumSize: Size(_currentPage == 0 ? width * 0.1 : double.infinity, height * 0.07),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: height * 0.03),
        ],
      ),
    );
  }
}
