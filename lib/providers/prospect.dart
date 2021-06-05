import 'dart:isolate';

import 'package:flutter/foundation.dart';

enum TYPE {
  ENTREPRISE,
  PERSONNE,
}

class Prospect with ChangeNotifier {
  final String cardNumber;
  final String name;
  final String email;
  final String contact;
  final String imageUrl;
  final double longitude;
  final double latitude;
  final TYPE type;
  bool isFavorite;

  Prospect( 
      {required this.cardNumber,
      required this.name,
      required this.email,
      required this.contact,
      required this.imageUrl,
      required this.longitude,
      required this.latitude,
      required this.type,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
