import 'package:flutter/material.dart';

import 'login/services/authservice.dart';

class AccountSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You are logged in'),
          ElevatedButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: Center(child: Text('LOG OUT')))
        ],
      ),
    );
  }
}
