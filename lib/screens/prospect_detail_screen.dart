import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:mu_shop/screens/map_screen.dart';
import 'package:provider/provider.dart';

class ProspectDetailScreen extends StatelessWidget {
  // final String name;

  // ProspectDetailScreen(this.name);

  static const routeName = '/prospect-detail';

  @override
  Widget build(BuildContext context) {
    final prospectCardNumber =
        ModalRoute.of(context)!.settings.arguments as String;

    final loadedProspect = Provider.of<Prospects>(context, listen: false)
        .findByCardNumber(prospectCardNumber);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProspect.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProspect.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${loadedProspect.name}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: Text(
                loadedProspect.email,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MapScreen(
                              // cardNumber: loadedProspect.cardNumber,
                              // contact: loadedProspect.contact,
                              // email: loadedProspect.email,
                              // name: loadedProspect.name,
                              // longitude: loadedProspect.longitude,
                              // latitude: loadedProspect.latitude,
                              // imageUrl: loadedProspect.imageUrl
                              );
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text('Locate'),
                      Icon(Icons.place),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
