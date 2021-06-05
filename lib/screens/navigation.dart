import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mu_shop/screens/account_settings_screen.dart';
import 'package:mu_shop/screens/modify_screen.dart';
import 'package:mu_shop/screens/prospects_overview_screen.dart';
import 'package:mu_shop/screens/search_prospect_screen.dart';

import 'add_new_prospect_screen.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {"page": ProspectsOverviewScreen()},
      {"page": SearchScreen()},
      {"page": AddNewProspect()},
      {"page": ModifyScreen()},
      {"page": AccountSettingScreen()}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: ConvexAppBar(
        onTap: _selectPage,
        initialActiveIndex: 0, //optional, default as 0
        // onTap: (int i) => print('click index=$i'),
        // currentIndex: _selectedPageIndex,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.edit, title: 'Modify'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        backgroundColor: Colors.green,
      ),
    );
  }
}
