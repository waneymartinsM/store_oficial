import 'package:flutter/material.dart';
import 'package:store_oficial/app/core/utils/custom_colors.dart';
import 'package:store_oficial/app/modules/home/home_page.dart';
import 'package:store_oficial/app/modules/home/view/chat/webe_chat_page.dart';
import 'package:store_oficial/app/modules/home/view/my_ads/my_ads_page.dart';
import 'package:store_oficial/app/modules/home/view/profile/profile_page.dart';

import 'view/heart/heart_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _pageIndex = 0;

  final List<Widget> _tabList = [
    const HomePage(),
    const HeartPage(),
    const WebeChatPage(),
    const MyAdsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: BottomNavigationBar(
                  backgroundColor: CustomColors.mainBlue,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: CustomColors.white,
                  unselectedItemColor: CustomColors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: _pageIndex,
                  onTap: (int index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },

                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/home.png',
                        height: 23,
                        color: _pageIndex == 0 ? CustomColors.white : CustomColors.grey,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/favorite.png',
                        height: 23,
                        color: _pageIndex == 1 ? CustomColors.white : CustomColors.grey,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/message.png',
                        height: 23,
                        color: _pageIndex == 2 ? CustomColors.white : CustomColors.grey,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/ad.png',
                        height: 23,
                        color: _pageIndex == 3 ? CustomColors.white : CustomColors.grey,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/avatar.png',
                        height: 23,
                        color: _pageIndex == 4 ? CustomColors.white : CustomColors.grey,
                      ),
                      label: "",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
