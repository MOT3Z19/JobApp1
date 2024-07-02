import 'package:flutter/material.dart';
import 'package:job_app/view/home_screens/home_page.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomePage()

  ];

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _tabs[_currentIndex], // Display the current tab's content
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF356899),
          unselectedItemColor: Color(0xFFCACBCE),
          currentIndex: _currentIndex,
          onTap: (int index) {
            // Update the current tab when a new tab is tapped
            setState(() {
              _currentIndex = index;
            });
          },
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/home.png'),
              activeIcon: Image.asset('assets/images/home_1.png'),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: Image.asset('assets/images/bookmark.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/message.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/category.png'),

              label: '',
            ),
          ],
        ),
      ),
    );
  }
}



