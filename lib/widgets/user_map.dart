import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mu_shop/providers/prospects.dart';
import 'package:provider/provider.dart';

class UserMap extends StatelessWidget {
  bool isSelected;
  UserMap(this.isSelected);

  @override
  Widget build(BuildContext context) {

    // final prospectsData = Provider.of<Prospects>(context);
    // final prospects = prospectsData.findByCardNumber(cardNumber);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      decoration: BoxDecoration(
        color: this.isSelected ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset.zero),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    'https://scontent.fabj1-1.fna.fbcdn.net/v/t1.6435-9/119991798_2459932704305243_4816174761319521195_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeFyBmiRetaVdEL1zWdA0JO74uOu5NR_7C_i467k1H_sLzZo2kFmW8OlAV498-&_nc_ohc=A6nZTWkKjdUAX8jWZAv&_nc_ht=scontent.fabj1-1.fna&oh=5acf8fb7ea33d6f8f41e52cd985e87f1&oe=60DF7220'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                  color: this.isSelected ? Colors.black : Colors.green,
                  width: 1),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Salomon DIEI',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  'My Location',
                  style: TextStyle(
                      color: this.isSelected ? Colors.white : Colors.green),
                ),
              ],
            ),
          ),
          Icon(
            Icons.location_pin,
            color: this.isSelected ? Colors.white : Colors.green,
            size: 40,
          ),
        ],
      ),
    );
  }
}
