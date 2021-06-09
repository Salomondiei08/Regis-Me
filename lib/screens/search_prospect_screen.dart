import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(labelText: 'Search something ?'),
        ),
      ),
      body: Center(
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.search,
                size: 200,
                color: Colors.grey,
              ),
            ),
            Text(
              'Search Something ?',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:floating_search_bar/floating_search_bar.dart';
// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return FloatingSearchBar.builder(
//       itemCount: 100,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           leading: Text(index.toString()),
//         );
//       },
//       trailing: CircleAvatar(
//         child: Text("RD"),
//       ),
//       drawer: Drawer(
//         child: Container(),
//       ),
//       onChanged: (String value) {},
//       onTap: () {},
//       decoration: InputDecoration.collapsed(
//         hintText: "Search...",
//       ),
//     );
//   }
// }
