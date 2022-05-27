import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/places.dart';

class MapScreen extends StatefulWidget {
  final PlacesLocation initialLocation;

  MapScreen(
      {Key? key,
      this.initialLocation = const PlacesLocation(
          latitude: -23.586479384589293, longitude: -46.68211058908439)})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione...'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 14,
        ),
      ),
    );
  }
}
