import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helper/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      altitude: locData.altitude,
      longitude: locData.longitude,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapScreen(
          isSelecting: true,
        ),
      ),
    );

    if (selectedLocation == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: _previewImageUrl == null
                ? Text(
                    'No Location chosen',
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(
                  Icons.location_on,
                ),
                label: Text('Current Location'),
                textColor: Theme.of(context).primaryColor,
                onPressed: _getCurrentUserLocation,
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.map,
                ),
                label: Text('Select On Map'),
                textColor: Theme.of(context).primaryColor,
                onPressed: _selectMap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
