import 'package:flutter/material.dart';

import 'package:mu_shop/providers/prospect.dart';
import 'package:provider/provider.dart';
import '../providers/prospects.dart';
import 'package:mu_shop/widgets/prospect_item.dart';

class ProspectGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prospectsData = Provider.of<Prospects>(context);
    final prospects = prospectsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: prospects.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: prospects[i],
        child: ProspectItem(
            // prospects[i].cardNumber, 
            // prospects[i].name, 
            // prospects[i].imageUrl
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 5 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
