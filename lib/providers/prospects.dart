import 'package:flutter/material.dart';

import 'package:mu_shop/providers/prospect.dart';

class Prospects with ChangeNotifier {
  List<Prospect> _items = [
    Prospect(
        cardNumber: '000000',
        name: 'VITIB',
        email: 'vitib@vitib.ci',
        contact: '09090897',
        imageUrl: 'https://news.abidjan.net/photos/photos/vitib(3).jpg',
        longitude: 10,
        latitude: 20,
        type: TYPE.ENTREPRISE),
    Prospect(
        cardNumber: '567890',
        name: 'IIT',
        email: 'iit@iit.ci',
        contact: '03039384',
        imageUrl:
            'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
        longitude: 67,
        latitude: 56,
        type: TYPE.ENTREPRISE),
    Prospect(
        cardNumber: '234567',
        name: 'KAYDAN',
        email: 'kaydan@kaydan.ci',
        contact: '847235273',
        imageUrl:
            'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
        longitude: 10,
        latitude: 45,
        type: TYPE.ENTREPRISE),
    Prospect(
        cardNumber: '234567',
        name: 'INVESTIV',
        email: 'invest@invest.ci',
        contact: '38404874',
        imageUrl:
            'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
        longitude: 24,
        latitude: 20,
        type: TYPE.ENTREPRISE),
    Prospect(
        cardNumber: '456788',
        name: 'REINVENT',
        email: 'rein@rein.ci',
        contact: '302837394',
        imageUrl:
            'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
        longitude: 78,
        latitude: 20,
        type: TYPE.ENTREPRISE),
  ];
  List<Prospect> get items {
    if (_showFavoriteOnly) {
      return _items.where((prosItem) => prosItem.isFavorite).toList();
    }
    return [..._items];
  }

  var _showFavoriteOnly = false;

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  Prospect findByCardNumber(String cardNumber) {
    return _items.firstWhere((pros) => pros.cardNumber == cardNumber);
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void deleteProspect(String name) {
    _items.removeWhere((pros) => pros.name == name);
    notifyListeners();
  }

  Prospect findById(String cardNumber) {
    return _items.firstWhere((pros) => pros.cardNumber == cardNumber);
  }

  void addProspect() {
    // _item.add(value);
    notifyListeners();
  }
}
