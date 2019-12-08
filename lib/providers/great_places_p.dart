import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../helper/db_helper.dart';

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

    DBHelper.insert(
      'places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }
}
