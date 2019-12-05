import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/gread_places_p.dart';
import 'screens/places_list_screen.dart';
import 'screens/add_place_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
		routes: {
			AddPlaceScreen.routeName: (context) => AddPlaceScreen(),
		}
      ),
    );
  }
}
