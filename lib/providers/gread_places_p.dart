import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places_app/models/place.dart';

import '../models/place.dart';

class GreatPlaces extends ChangeNotifier {
  var _items = List<Place>();

  get items => [..._items];

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: pickedTitle,
        location: null);

    _items.add(newPlace);
    notifyListeners();
  }
}
