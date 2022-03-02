import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolearn/screen/accountPage/account_screen.dart';
import 'package:kolearn/screen/home/home_screen.dart';
import 'package:kolearn/screen/my_course/my_course.dart';
import 'package:kolearn/screen/notif_page/notif_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const MyCourse(),
    const NotifScreen(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home.svg', height: 30.h),
            label: 'Home',
            activeIcon:
                SvgPicture.asset('assets/home_active.svg', height: 30.h),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/file-check.svg', height: 30.h),
            label: 'My Course',
            activeIcon:
                SvgPicture.asset('assets/file-check_active.svg', height: 30.h),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/bell.svg', height: 30.h),
            label: 'Notification',
            activeIcon:
                SvgPicture.asset('assets/bell_active.svg', height: 30.h),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/user.svg', height: 30.h),
            label: 'Akun',
            activeIcon:
                SvgPicture.asset('assets/user_active.svg', height: 30.h),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
