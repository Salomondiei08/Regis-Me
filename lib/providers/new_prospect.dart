import 'dart:isolate';

import 'package:flutter/foundation.dart';

enum TYPE {
  ENTREPRISE,
  PERSONNE,
}

class NProspect with ChangeNotifier {
   String cardNumber;
   String name;
   String email;
   String contact;
   String imageUrl;
   double longitude;
   double lattitude;
   TYPE type;
  bool isFavorite;

  NProspect( 
      {required this.cardNumber,
      required this.name,
      required this.email,
      required this.contact,
      required this.imageUrl,
      required this.longitude,
      required this.lattitude,
      required this.type,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
