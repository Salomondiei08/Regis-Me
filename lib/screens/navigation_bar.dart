import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mu_shop/screens/prospects_overview_screen.dart';
import 'package:mu_shop/screens/search_page_screen.dart';
import 'package:mu_shop/screens/search_prospect_screen.dart';
import 'search_page_screen.dart';

import 'account_settings_screen.dart';
import 'add_new_prospect_screen.dart';
import 'modify_screen.dart';

class MyCustomBottomNavigationBar extends StatefulWidget {
  @override
  MyCustomBottomNavigationBarState createState() =>
      MyCustomBottomNavigationBarState();
}

class MyCustomBottomNavigationBarState
    extends State<MyCustomBottomNavigationBar> {
  List<Map<String, Widget>> _pages = [];
  // int _selectedPageIndex = 0;

  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  void initState() {
    _pages = [
      {"page": ProspectsOverviewScreen()},
      {"page": SearchListWidget()},
      {"page": AddNewProspect()},
      {"page": ModifyScreen()},
      {"page": AccountSettingScreen()}
    ];
    super.initState();
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[currentIndex]["page"],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: _width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: _width * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? _width * .12 : 0,
                      width: index == currentIndex ? _width * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.green.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _width * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: _width * .076,
                    color:
                        index == currentIndex ? Colors.green : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.add_rounded,
    Icons.edit_rounded,
    Icons.person_rounded,
  ];
}
