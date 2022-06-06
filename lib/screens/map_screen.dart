import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/Models/places.dart';

class MapScreen extends StatefulWidget {
  final PlacesLocation initialLocation;
  final bool isReadOnly;

  MapScreen({
    Key? key,
    this.isReadOnly = false,
    //Posição setada para o escritório do google em SP
    this.initialLocation = const PlacesLocation(
        latitude: -23.586479384589293, longitude: -46.68211058908439),
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          'Selecione...',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: _pickedPosition == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedPosition);
                    },
              icon: const Icon(Icons.check),
            ),
        ],
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        //Set é uma lista de elementos que não aceita repetição
        //Se a posição não estiver selecionada vai retornar null
        markers: (_pickedPosition == null && !widget.isReadOnly)
            ? Set()
            : {
                Marker(
                  markerId: const MarkerId('p1'),
                  position: _pickedPosition ?? widget.initialLocation as LatLng,
                ),
              },
      ),
    );
  }
}
