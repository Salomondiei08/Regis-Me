import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:provider/provider.dart';

class UserProspectItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  UserProspectItem(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<Prospects>(context, listen: false).deleteProspect(name);
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
