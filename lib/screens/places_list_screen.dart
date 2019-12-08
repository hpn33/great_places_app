import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/gread_places_p.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your place\'s'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:
            Center(child: const Text('Got no places yet, start adding some!')),
        builder: (context, greatPlaces, child) => greatPlaces.items.length <= 0
            ? child
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (context, index) {
                  final place = greatPlaces.items[index];

                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(
                          place.image,
                        ),
                      ),
                      title: Text(place.title),
                      onTap: () {
                        // go to the detail page ...
                      });
                }),
      ),
    );
  }
}
