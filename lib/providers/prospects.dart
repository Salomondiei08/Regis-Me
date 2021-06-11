import 'package:flutter/material.dart';

import 'package:mu_shop/providers/prospect.dart';
import 'package:mu_shop/screens/add_new_prospect_screen.dart';

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
    ),
    Prospect(
      cardNumber: '567890',
      name: 'IIT',
      email: 'iit@iit.ci',
      contact: '03039384',
      imageUrl:
          'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
      longitude: 67,
      latitude: 56,
    ),
    Prospect(
      cardNumber: '234567',
      name: 'KAYDAN',
      email: 'kaydan@kaydan.ci',
      contact: '847235273',
      imageUrl:
          'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
      longitude: 10,
      latitude: 45,
    ),
    Prospect(
      cardNumber: '234567',
      name: 'INVESTIV',
      email: 'invest@invest.ci',
      contact: '38404874',
      imageUrl:
          'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
      longitude: 24,
      latitude: 20,
    ),
    Prospect(
      cardNumber: '456788',
      name: 'REINVENT',
      email: 'rein@rein.ci',
      contact: '302837394',
      imageUrl:
          'https://i2.wp.com/www.africanewsquick.net/wp-content/uploads/2019/10/FB_IMG_1570965100834.jpg?resize=640%2C425',
      longitude: 78,
      latitude: 20,
    ),
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

  void deleteProspect(String cardNumber) {
    _items.removeWhere((pros) => pros.cardNumber == cardNumber);
    notifyListeners();
  }

  Prospect findById(String cardNumber) {
    return _items.firstWhere((pros) => pros.cardNumber == cardNumber);
  }

  //   filterSearch(String query) {
  //   List<Prospect> searchList = [];
  //   searchList.addAll(items);
  //   if (query.isNotEmpty) {
  //     List<Prospect> resultListData = [];
  //     searchList.forEach((item) {
  //       if (item.contains(query)) {
  //         resultListData.add(item);
  //       }
  //     });
  //     // setState(() {
  //       showItemList.clear();
  //       showItemList.addAll(resultListData);
  //     // });
  //     return;
  //   } else {
  //     // setState(() {
  //       showItemList.clear();
  //       showItemList.addAll(items);
  //     // });
  //   }
  // }

  List<Prospect> searchItems(String name) {
    if ((name.isNotEmpty) && (name != "")) {
      print('Tout a été retourné');
      print('la variable = $name');
      print(
          'la longueur de la liste est : ${_items.where((prosItem) => prosItem.name.toLowerCase().startsWith(name.toLowerCase())).toList().length}');
      // print('$_items');
      return [
        ..._items
            .where((prosItem) =>
                prosItem.name.toLowerCase().startsWith(name.toLowerCase()))
            .toList()
      ];
    }
    return [..._items];
  }

  Prospect findByName(String name) {
    return _items.firstWhere((pros) => pros.name == name);
  }

  void updateProspect(String cardNumber, Prospect newProspect) {
    final prosIndex =
        _items.indexWhere((pros) => pros.cardNumber == cardNumber);
    if (prosIndex >= 0) {
      _items[prosIndex] = newProspect;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void addProspect(Prospect prospect) {
    final newProspect = Prospect(
        cardNumber: prospect.cardNumber,
        name: prospect.name,
        email: prospect.email,
        contact: prospect.contact,
        imageUrl: prospect.imageUrl,
        longitude: prospect.longitude,
        latitude: prospect.latitude);
    // _items.add(newProspect);
    _items.insert(0, newProspect);
    notifyListeners();
  }
}
