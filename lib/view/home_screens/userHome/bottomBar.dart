import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_app/view/courses_screens/allCourses_screen.dart';
import 'package:job_app/view/home_screens/UserHome/home_page.dart';
import 'package:job_app/view/profiles_screens/serviceProvider_screens/serviceProviderProfile.dart';
import '../../job_screens/jobsRequests_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    AllCoursesScreen(),
    JobRequests(),
    ServiceProviderProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _tabs[_currentIndex], // Display the current tab's content
      bottomNavigationBar: BottomNavigationBar(
        elevation:3,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Update the current tab when a new tab is tapped
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/home.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/homeS.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/play.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/playS.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/employee.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/employeeS.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Builder(builder: (context) {
              return SvgPicture.asset(
                  'assets/images/home_icons/drawer_icon/serviceProvider.svg');
            }),
            activeIcon: SvgPicture.asset(
                'assets/images/home_icons/bottomBar_icon/providerS.svg'),
            label: '',
          ),
        ],
      ),
    );
  }

}
