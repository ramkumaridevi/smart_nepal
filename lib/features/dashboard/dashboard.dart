import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_nepal/core/constants/app_constant.dart';
import 'package:smart_nepal/features/dashboard/components/book/book_screen.dart';
import 'package:smart_nepal/features/dashboard/components/home/presentation/home_screen.dart';
import 'package:smart_nepal/features/dashboard/components/profile/profile_screen.dart';
import 'package:smart_nepal/features/dashboard/components/room/room_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const <Widget>[
          HomeScreen(),
          BookScreen(),
          RoomScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WaterDropNavBar(
            backgroundColor: navigationBarColor,
            waterDropColor: AppColors.primary, // Your theme color
            inactiveIconColor: Colors.grey.shade400,
            barItems: [
              BarItem(
                filledIcon: BoxIcons.bxs_home, // Solid home
                outlinedIcon: BoxIcons.bx_home, // Outlined home
              ),
              BarItem(
                filledIcon: BoxIcons.bxs_book_alt, // Solid book
                outlinedIcon: BoxIcons.bx_book_alt, // Outlined book
              ),
              BarItem(
                filledIcon: BoxIcons.bxs_building, // Solid room
                outlinedIcon: BoxIcons.bx_building, // Outlined room
              ),
              BarItem(
                filledIcon: BoxIcons.bxs_user, // Solid profile
                outlinedIcon: BoxIcons.bx_user, // Outlined profile
              ),
            ],
            selectedIndex: selectedIndex,
            onItemSelected: (int index) {
              setState(() => selectedIndex = index);
              pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad,
              );
            },
          ),
          // Labels with matching colors
          Container(
            color: navigationBarColor,
            padding: const EdgeInsets.only(bottom: 20, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavLabel(0, 'Home'),
                _buildNavLabel(1, 'Book'),
                _buildNavLabel(2, 'Room'),
                _buildNavLabel(3, 'Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLabel(int index, String text) {
    return Text(
      text,
      style: TextStyle(
        color:
            selectedIndex == index ? AppColors.primary : Colors.grey.shade600,
        fontWeight:
            selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
        fontSize: 12,
        letterSpacing: 0.5,
      ),
    );
  }
}
