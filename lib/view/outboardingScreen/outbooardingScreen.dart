import 'package:flutter/material.dart';




class OnboardingScreen extends StatelessWidget {
  final List<OnboardingData> onboardingData = [
    OnboardingData(
      image: 'assets/images/out_1.png',
      title: 'تصفح قائمة الوظائف',
      subtitle: 'تتضمن قائمة الوظائف لدينا العديد من الصناعات، حتى تتمكن من العثور على أفضل وظيفة لك.',
    ),
    OnboardingData(
      image: 'assets/images/out_2.png',
      title: 'التقدم إلى أفضل الوظائف',
      subtitle: 'يمكنك التقديم على الوظائف المرغوبة لديك بسرعة وسهولة وبكل سهولة.',
    ),
    OnboardingData(
      image: 'assets/images/out_3.png',
      title: 'اجعل حياتك المهنية',
      subtitle: 'نحن نساعدك في العثور على موظفين أحلامك بناءً على متطلباتك وطلبك.',
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.blue,
            ),
          ),
          PageView.builder(
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                data: onboardingData[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;

  OnboardingData({required this.image, required this.title, required this.subtitle});
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data.image,
          height: 300,
        ),
        SizedBox(height: 20),
        Text(
          data.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          data.subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height * 1.5, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
