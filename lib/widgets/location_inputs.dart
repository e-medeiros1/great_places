import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/others/location_util.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInputs extends StatefulWidget {
  const LocationInputs({Key? key, required this.onSelectPosition})
      : super(key: key);

  final Function onSelectPosition;
  @override
  State<LocationInputs> createState() => _LocationInputsState();
}

class _LocationInputsState extends State<LocationInputs> {
  String? _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      _showPreview(locData.latitude as double, locData.longitude as double);
      widget.onSelectPosition(LatLng(
        locData.latitude as double,
        locData.longitude as double,
      ));
    } catch (e) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(),
      ),
    );

    if (selectedPosition == null) return;

    _showPreview(selectedPosition.latitude, selectedPosition.longitude);
    widget.onSelectPosition(selectedPosition);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.40,
          width: size.width * 0.9,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'Preview indisponível',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    _previewImageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 404,
                  ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(
                Icons.location_on,
                color: Colors.red.shade500,
              ),
              label: Text(
                'Localização atual',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map, color: Colors.blue.shade700),
              label: Text(
                'Selecione no mapa',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ],
        )
      ],
    );
  }
}
