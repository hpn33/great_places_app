import 'package:flutter/foundation.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlaces extends ChangeNotifier {
  var _items = List<Place>();

  get items => [..._items];
}
