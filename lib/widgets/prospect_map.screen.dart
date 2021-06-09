import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:provider/provider.dart';

class ProspectMap extends StatelessWidget {
  final String cardNumber;
  ProspectMap({required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    final prospectsData = Provider.of<Prospects>(context);
    final prospects = prospectsData.findByCardNumber(cardNumber);

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset.zero,
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.network(
                        prospects.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.circle,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        prospects.name,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(prospects.email),
                      Text(
                        prospects.contact,
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
