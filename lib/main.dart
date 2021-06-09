import 'package:flutter/material.dart';
import 'package:mu_shop/screens/add_new_prospect_screen.dart';
import 'package:mu_shop/screens/edit_new_prospect_screnn.dart';
import 'package:mu_shop/screens/intro_screen.dart';
import 'package:mu_shop/screens/modify_screen.dart';
import 'package:mu_shop/screens/navigation.dart';
import 'package:mu_shop/screens/splashscreen.dart';
// import 'package:mu_shop/screens/prospects_overview_screen.dart';
import 'package:provider/provider.dart';
// import 'providers/prospect.dart';
import 'providers/prospects.dart';

import '../screens/prospect_detail_screen.dart';
// import '../screens/prospects_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Prospects(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RegisMe',
        theme: ThemeData(
          // textTheme: TextTheme(body1: ),
          fontFamily: 'Lato',
          primaryColor: Colors.green,
          accentColor: Colors.green,
        ),
        home: MyCustomSplashScreen(),
        routes: {
          EditNewProspect.routeName: (ctx) => EditNewProspect(),
          ProspectDetailScreen.routeName: (ctx) => ProspectDetailScreen(),
          ModifyScreen.routeName: (ctx) => ModifyScreen(),
          AddNewProspect.routeName: (ctx) => AddNewProspect(),
        },
      ),
    );
  }
}
