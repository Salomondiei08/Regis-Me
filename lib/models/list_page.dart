import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> getPage() {
  return [
    PageViewModel(
      // title: "Never fill embarssaed again when prospecting",
      titleWidget: Text(
        "Never feel embarssaed again when prospecting",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Center(
          //   child: SizedBox(
          //     width: 300,
          //     child: Text(
          //       "RegisMe allows you to quickly register and save your prospects",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(color: Colors.green),
          //     ),
          //   ),
          // ),
        ],
      ),
      image: Center(
        child: Image(
          image: AssetImage('assets/regisme.png'),
        ),
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        "Never loose a client again",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      image: Center(
        child: Image(
          image: AssetImage('assets/regisme.png'),
        ),
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        "Boost your productivity it's full potentiel",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      image: Center(
        child: Image(
          image: AssetImage('assets/regisme.png'),
        ),
      ),
    ),
  ];
}
