// // import this Package in pubspec.yaml file
// // dependencies:
// // 
// //   flutter_staggered_animations: ^1.0.0




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:mu_shop/providers/prospects.dart';
// import 'package:mu_shop/screens/prospects_overview_screen.dart';
// import 'package:provider/provider.dart';

// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }

// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   @override
//   Widget build(BuildContext c) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('VIEW ANIMATING GRIDVIEW'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => GridView1()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class GridView1 extends StatelessWidget {
//       final prospectsContainer = Provider.of<Prospects>(context, listen: false);
//   @override
//   Widget build(BuildContext context) {
//     double _w = MediaQuery.of(context).size.width;
//     int columnCount = 3;

//     return Scaffold(
//       appBar: AppBar(
//                   brightness: Brightness.dark,
//           title: Text('RegisMe'),
//           actions: [
//             PopupMenuButton(
//               itemBuilder: (_) => [
//                 PopupMenuItem(
//                     child: Text('Only Favorites'),
//                     value: FilterOptions.Favorites),
//                 PopupMenuItem(
//                     child: Text('Show All'), value: FilterOptions.All),
//               ],
//               icon: Icon(Icons.more_vert),
//               onSelected: (FilterOptions selectedValue) {
//                 if (selectedValue == FilterOptions.Favorites) {
//                   productsContainer.showFavoriteOnly();
//                 } else {
//                   productsContainer.showAll();
//                 }
//               },
//             ),
//           ],
//         ),

//       body: AnimationLimiter(
//         child: GridView.count(
//           physics:
//               BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//           padding: EdgeInsets.all(_w / 60),
//           crossAxisCount: columnCount,
//           children: List.generate(
//             50,
//             (int index) {
//               return AnimationConfiguration.staggeredGrid(
//                 position: index,
//                 duration: Duration(milliseconds: 500),
//                 columnCount: columnCount,
//                 child: ScaleAnimation(
//                   duration: Duration(milliseconds: 900),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   child: FadeInAnimation(
//                     child: Container(
//                       margin: EdgeInsets.only(
//                           bottom: _w / 30, left: _w / 60, right: _w / 60),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 40,
//                             spreadRadius: 10,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }