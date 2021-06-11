import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:mu_shop/screens/edit_new_prospect_screnn.dart';
import 'package:mu_shop/screens/prospect_detail_screen.dart';
import 'package:provider/provider.dart';

class InfoSearch extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String cardnumber;

  InfoSearch(this.name, this.imageUrl, this.cardnumber);

  @override
  _InfoSearchState createState() => _InfoSearchState();
}

class _InfoSearchState extends State<InfoSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProspectDetailScreen.routeName, arguments: widget.cardnumber);
      },
      child: ListTile(
        title: Text(widget.name),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            widget.imageUrl,
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
