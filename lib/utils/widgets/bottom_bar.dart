import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/dashboard/dashboard.dart';

Widget persistentBottomBar(int page) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.whiteColor,
    currentIndex: page,
    selectedItemColor: AppColors.yellowColor,
    unselectedItemColor: AppColors.grey,
    onTap: (int index) {
      Get.offAll(Dashboard(page: index));
    },
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/home.svg',
          color: page == 0 ? AppColors.yellowColor : AppColors.grey,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/team.svg',
          color: page == 1 ? AppColors.yellowColor : AppColors.grey,
        ),
        label: 'My Teams',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/faq.svg',
          color: page == 2 ? AppColors.yellowColor : AppColors.grey,
        ),
        label: 'FAQ',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/profile.svg',
          color: page == 3 ? AppColors.yellowColor : AppColors.grey,
        ),
        label: 'Profile',
      ),
    ],
  );
}
