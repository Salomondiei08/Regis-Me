import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospect.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:mu_shop/screens/prospect_detail_screen.dart';
import 'package:mu_shop/widgets/user_prospect_item.dart';
import 'package:provider/provider.dart';

import 'info_view_search.dart';

class SearchListWidget extends StatefulWidget {
  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  TextEditingController textEditingController = TextEditingController();
  List<Prospect> showItemList = [];
  List<Prospect> initList = [];

  @override
  void initState() {
    showItemList.addAll(initList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String searchWord = 'i';
    final prospectsData = Provider.of<Prospects>(context);
    return Scaffold(
      appBar: AppBar(
        title: AnimSearchBar(
          helpText: 'Search...',
          closeSearchOnSuffixTap: false,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.green,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.green,
          ),
          rtl: true,
          width: 400,
          onSuffixTap: () {
            setState(
              () {
                searchWord = textEditingController.text;
                print(searchWord);
                prospectsData.searchItems(searchWord);
                showItemList.clear();
                showItemList.addAll(prospectsData.searchItems(searchWord));
                // filterSearch();
                // textEditingController.clear();
                print('$showItemList');
              },
            );
          },
          textController: textEditingController,
        ),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ListView.builder(
          itemCount: showItemList.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProspectDetailScreen.routeName,
                  arguments: showItemList[i].cardNumber);
            },
            child: ListTile(
              title: Text(showItemList[i].name),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  showItemList[i].imageUrl,
                ),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//   void filterSearch() {
//     setState(() {});
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mu_shop/providers/prospects.dart';
// import 'package:mu_shop/widgets/user_prospect_item.dart';
// import 'package:provider/provider.dart';

// class SearchListWidget extends StatefulWidget {
//   @override
//   _SearchListWidgetState createState() => _SearchListWidgetState();
// }

// class _SearchListWidgetState extends State<SearchListWidget> {
//   final initList = List<String>.generate(10000, (i) => "Search Item $i");
//   TextEditingController editingController = TextEditingController();
//   var showItemList = [];

//   @override
//   void initState() {
//     showItemList.addAll(initList);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String searchWord = '';
//     final prospectsData = Provider.of<Prospects>(context);
//     return Scaffold(
//           body: Column(
//         children: <Widget>[
//           TextField(
//             controller: editingController,
//             decoration: InputDecoration(
//               labelText: "Search",
//               hintText: "Search",
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(24)),
//               ),
//             ),
//             onChanged: (value) {
//               // filterSearch(value);
//               searchWord = value;
//             },
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: prospectsData.searchItems(searchWord).length,
//               itemBuilder: (_, i) => Column(
//                 children: [
//                   UserProspectItem(
//                     prospectsData.searchItems(searchWord)[i].name,
//                     prospectsData.searchItems(searchWord)[i].imageUrl,
//                     prospectsData.searchItems(searchWord)[i].cardNumber,
//                   ),
//                   Divider()
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//  ListTile(
//             title: Text('${prospectsData.searchItems(searchWord)[i].imageUrl}'),
//           ),

//   filterSearch(String query) {
//     List<String> searchList = [];
//     searchList.addAll(initList);
//     if (query.isNotEmpty) {
//       List<String> resultListData = [];
//       searchList.forEach((item) {
//         if (item.contains(query)) {
//           resultListData.add(item);
//         }
//       });
//       setState(() {
//         showItemList.clear();
//         showItemList.addAll(resultListData);
//       });
//       return;
//     } else {
//       setState(() {
//         showItemList.clear();
//         showItemList.addAll(initList);
//       });
//     }
//   }
// }
