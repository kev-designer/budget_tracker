import 'package:budget_tracker/pages/home_page.dart';
import 'package:budget_tracker/pages/profile_page.dart';
import 'package:budget_tracker/services/theme_service.dart';
import 'package:budget_tracker/widget/colors.dart';
import 'package:budget_tracker/widget/const.dart';
import 'package:budget_tracker/widget/dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              themeService.darkTheme = !themeService.darkTheme;
            },
            icon: Icon(themeService.darkTheme ? Icons.sunny : Icons.dark_mode),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BudgetDialog(budgetToAdd: (budget) {});
                    },
                  );
                },
                icon: const Icon(Icons.attach_money_rounded),
              ),
            )
          ],
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
        // selectedItemColor: ColorData.white,
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
    icon: Icon(CupertinoIcons.house),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.person),
    label: "Profile",
  ),
];

List<Widget> pages = const [
  HomePage(),
  ProfilePage(),
];
