import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospect.dart';
import 'package:provider/provider.dart';
import '../screens/prospect_detail_screen.dart';

class ProspectItem extends StatelessWidget {
  // final String cardNumer;
  // final String name;
  // final String imageUrl;

  // ProspectItem(this.cardNumer, this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final prospect = Provider.of<Prospect>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProspectDetailScreen.routeName,
                arguments: prospect.cardNumber);
          },
          child: Image.network(
            prospect.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            prospect.name,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Prospect>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(prospect.isFavorite ? Icons.star : Icons.star_border),
              onPressed: () {
                prospect.toggleFavoriteStatus();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Company added to favorite'),
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                      },
                    ),
                  ),
                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
