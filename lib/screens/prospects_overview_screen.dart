import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:mu_shop/widgets/prospect_grid.dart';
import 'package:provider/provider.dart';
import '../providers/prospects.dart';

import '../widgets/prospect_grid.dart';


enum FilterOptions { Favorites, All }

class ProspectsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prospectsContainer = Provider.of<Prospects>(context, listen: false);
    return Scaffold(
        // bottomNavigationBar: ConvexAppBar(
        //   items: [
        //     TabItem(icon: Icons.home, title: 'Home'),
        //     TabItem(icon: Icons.search, title: 'Search'),
        //     TabItem(icon: Icons.add, title: 'Add'),
        //     TabItem(icon: Icons.info, title: 'About'),
        //     TabItem(icon: Icons.people, title: 'Profile'),
        //   ],
        //   initialActiveIndex: 2, //optional, default as 0
        //   onTap: (int i) => print('click index=$i'),
        // ),
        appBar: AppBar(
          title: Text('RegisMe'),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                    child: Text('Show All'), value: FilterOptions.All),
              ],
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.Favorites) {
                  prospectsContainer.showFavoriteOnly();
                } else {
                  prospectsContainer.showAll();
                }
              },
            ),
          ],
        ),
        body: ProspectGrid());
  }
}
