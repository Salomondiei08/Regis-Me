import 'package:flutter/material.dart';
import '../widgets/user_prospect_item.dart';
import 'package:provider/provider.dart';
import '../providers/prospects.dart';

class ModifyScreen extends StatelessWidget {
  const ModifyScreen({Key? key}) : super(key: key);

  static const routeName = '/modify';
  @override
  Widget build(BuildContext context) {
    final prospectsData = Provider.of<Prospects>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Prospects'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: prospectsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProspectItem(
                  prospectsData.items[i].name, prospectsData.items[i].imageUrl),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
