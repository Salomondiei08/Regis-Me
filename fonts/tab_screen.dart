import 'package:flutter/material.dart';
import 'package:mu_shop/screens/account_settings_screen.dart';
import 'package:mu_shop/screens/prospect_detail_screen.dart';
import 'package:mu_shop/screens/prospects_overview_screen.dart';
import 'package:mu_shop/screens/search_prospect_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
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
      {
        "page": ProspectsOverviewScreen(),
        "title": Text("RegisMe", style: TextStyle(color: Colors.white))
      },
      {
        "page": SearchScreen(),
        "title": Text("Search", style: TextStyle(color: Colors.white))
      },
      {
        "page": AccountSettingScreen(),
        "title": Text("Account Settings", style: TextStyle(color: Colors.white))
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]["title"],
        backgroundColor: Colors.amber,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProspectsOverviewScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
