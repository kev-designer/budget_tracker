import 'package:budget_tracker/pages/home_page.dart';
import 'package:budget_tracker/pages/profile_page.dart';
import 'package:budget_tracker/widget/colors.dart';
import 'package:budget_tracker/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
          title: Text(
        "Budget Tracker",
        style: GoogleFonts.lato(
          fontSize: height(context) * .02,
          fontWeight: FontWeight.w600,
        ),
      )),
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: bottomNavItems,
        selectedLabelStyle: GoogleFonts.nunito(),
        unselectedLabelStyle: GoogleFonts.nunito(),
        selectedItemColor: ColorData.white,
        onTap: (index) {
          setState(
            () {
              _currentPageIndex = index;
            },
          );
        },
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavItems = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "Profile",
  ),
];

List<Widget> pages = const [
  HomePage(),
  ProfilePage(),
];
