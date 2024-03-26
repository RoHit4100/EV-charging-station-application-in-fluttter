import 'package:fl_speedcharge/pages/en_route/en_route_page.dart';
import 'package:fl_speedcharge/pages/favourite/favourite_page.dart';
import 'package:fl_speedcharge/pages/home/home_page.dart';
import 'package:fl_speedcharge/pages/profile/profile_page.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'helper/language_constant.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const EnRoutePage(),
    const FavouritePage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: white,
        ),
        child: BottomNavigationBar(
          elevation: 20,
          items: [
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(homeSvg,
                      color: selectedIndex == 0 ? primaryColor : appGrey),
                ),
                label: translation(context).search),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(enRouteSvg,
                      color: selectedIndex == 1 ? primaryColor : appGrey),
                ),
                label: translation(context).enRoute),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(favouriteSvg,
                      color: selectedIndex == 2 ? primaryColor : appGrey),
                ),
                label: translation(context).favourite),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 3.2.h,
                  child: SvgPicture.asset(profileSvg,
                      color: selectedIndex == 3 ? primaryColor : appGrey),
                ),
                label: translation(context).profile),
          ],
          onTap: (int index) {
            setState(() => selectedIndex = index);
          },
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: appGrey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: primarySemiBold14,
          unselectedLabelStyle: dashLineSemiBold14,
        ),
      ),
      body: _widgetOptions.elementAt(selectedIndex),
    );
  }
}
