import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mu_shop/models/list_page.dart';
import 'package:mu_shop/screens/login/login_page.dart';
import 'login/services/authservice.dart';
import 'navigation_bar.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getPage(),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AuthService().handleAuth();
              },
            ),
          );
        },
        onSkip: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AuthService().handleAuth();
              },
            ),
          );
          // You can also override onSkip callback
        },
        showSkipButton: true,
        skip: Text(
          'Skip',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.green,
        ),
        done: const Text("Done",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.green,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
