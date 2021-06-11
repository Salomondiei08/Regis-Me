// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:mu_shop/providers/prospects.dart';
// import 'package:mu_shop/widgets/user_prospect_item.dart';
// import 'package:provider/provider.dart';

// import 'info_view_search.dart';

// class SearchListWidget extends StatefulWidget {
//   @override
//   _SearchListWidgetState createState() => _SearchListWidgetState();
// }

// class _SearchListWidgetState extends State<SearchListWidget> {
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     String searchWord = '';
//     final prospectsData = Provider.of<Prospects>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: AnimSearchBar(
//           helpText: 'Search...',
//           closeSearchOnSuffixTap: true,
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.green,
//           ),
//           suffixIcon: Icon(
//             Icons.clear,
//             color: Colors.green,
//           ),
//           rtl: true,
//           width: 400,
//           onSuffixTap: (value) {
//             setState(
//               () {
//                 searchWord = value;
//                 print(value);
//               },
//             );
//           },
//           textController: textEditingController,
//         ),
//       ),
//       body: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: ListView.builder(
//           itemCount: prospectsData.items.length,
//           itemBuilder: (_, i) => Column(
//             children: [
//               InfoSearch(
//                 prospectsData.items[i].name,
//                 prospectsData.items[i].imageUrl,
//                 prospectsData.items[i].cardNumber,
//               ),
//               Divider()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
// import 'package:mu_shop/providers/prospects.dart';
// import 'package:mu_shop/widgets/user_prospect_item.dart';
// import 'package:provider/provider.dart';
// import '../providers/prospects.dart';
// import 'info_view_search.dart';
// import 'navigation_bar.dart';

// class SearchScreen extends StatefulWidget {
//   String searchWord = '';
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;

//     final prospectsData = Provider.of<Prospects>(context);
//     final prospects = prospectsData.searchItems(widget.searchWord);

//     return Scaffold(
//       // This is handled by the search bar itself.
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // buildMap(),
//           // buildBottomNavigationBar(),
//           FloatingSearchBar(
//             hint: 'Search...',
//             scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//             transitionDuration: const Duration(milliseconds: 800),
//             transitionCurve: Curves.easeInOut,
//             physics: const BouncingScrollPhysics(),
//             axisAlignment: isPortrait ? 0.0 : -1.0,
//             openAxisAlignment: 0.0,
//             width: isPortrait ? 600 : 500,
//             debounceDelay: const Duration(milliseconds: 500),
//             onQueryChanged: (query) {
//               // setState(() {
//               // widget.searchWord = query;
//               // });

//               // Call your model, bloc, controller here.
//             },
//             onSubmitted: (query) {
//                widget.searchWord = query;
//             },
//             // Specify a custom transition to be used for
//             // animating between opened and closed stated.
//             transition: CircularFloatingSearchBarTransition(),
//             actions: [
//               FloatingSearchBarAction(

//                 showIfOpened: false,
//                 child: CircularButton(
//                   icon: const Icon(
//                     Icons.search,
//                     color: Colors.green,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               FloatingSearchBarAction.searchToClear(
//                 showIfClosed: false,
//               ),
//             ],
//             builder: (context, transition) {
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child:  ListView.builder(
//               itemCount: prospectsData.items.length,
//               itemBuilder: (_, i) => Column(
//                 children: [
//                   InfoSearch(
//                     prospectsData.items[i].name,
//                     prospectsData.items[i].imageUrl,
//                     prospectsData.items[i].cardNumber,
//                   ),
//                   Divider()
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget buildFloatingSearchBar() {

//   //   return FloatingSearchBar(
//   //     hint: 'Search...',
//   //     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//   //     transitionDuration: const Duration(milliseconds: 800),
//   //     transitionCurve: Curves.easeInOut,
//   //     physics: const BouncingScrollPhysics(),
//   //     axisAlignment: isPortrait ? 0.0 : -1.0,
//   //     openAxisAlignment: 0.0,
//   //     width: isPortrait ? 600 : 500,
//   //     debounceDelay: const Duration(milliseconds: 500),
//   //     onQueryChanged: (query) {
//   //       widget.searchWord = query;
//   //       // Call your model, bloc, controller here.
//   //     },
//   //     // Specify a custom transition to be used for
//   //     // animating between opened and closed stated.
//   //     transition: CircularFloatingSearchBarTransition(),
//   //     actions: [
//   //       FloatingSearchBarAction(
//   //         showIfOpened: false,
//   //         child: CircularButton(
//   //           icon: const Icon(
//   //             Icons.search,
//   //             color: Colors.green,
//   //           ),
//   //           onPressed: () {},
//   //         ),
//   //       ),
//   //       FloatingSearchBarAction.searchToClear(
//   //         showIfClosed: false,
//   //       ),
//   //     ],
//   //     builder: (context, transition) {
//   //       return ClipRRect(
//   //         borderRadius: BorderRadius.circular(8),
//   //         child: ListView.builder(
//   //           itemCount: widget.prospectsData.items.length,
//   //           itemBuilder: (_, i) => Column(
//   //             children: [
//   //               UserProspectItem(
//   //                 prospectsData.items[i].name,
//   //                 prospectsData.items[i].imageUrl,
//   //                 prospectsData.items[i].cardNumber,
//   //               ),
//   //               Divider()
//   //             ],
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
// }

// Widget buildMap() {
//   return Scaffold();
// }

// Widget buildBottomNavigationBar() {
//   return Scaffold();
// }
