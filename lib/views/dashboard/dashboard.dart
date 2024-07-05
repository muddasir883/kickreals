import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/FAQ/faq_page.dart';
import 'package:kick_reels/views/HomePage/homepage.dart';
import 'package:kick_reels/views/MyTeams/team_list.dart';
import 'package:kick_reels/views/Profile/my_profile.dart';

class Dashboard extends StatefulWidget {
  final int? page;
  const Dashboard({super.key, this.page});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int _index = widget.page ?? 0;
  final List<Widget> _pages = const [
    Homepage(),
    TeamList(),
    FaqPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.whiteColor,
        currentIndex: _index,
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: AppColors.grey,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              color: _index == 0 ? AppColors.yellowColor : AppColors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/team.svg',
              color: _index == 1 ? AppColors.yellowColor : AppColors.grey,
            ),
            label: 'My Teams',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/faq.svg',
              color: _index == 2 ? AppColors.yellowColor : AppColors.grey,
            ),
            label: 'FAQ',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/profile.svg',
              color: _index == 3 ? AppColors.yellowColor : AppColors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_index],
    );
  }
}
