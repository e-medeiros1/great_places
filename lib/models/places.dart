import 'dart:io';

class Places {
  final String id;
  final String title;
  final File image;
  final PlacesLocation? location;

  Places({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}

class PlacesLocation {
  final double latitude;
  final double longitude;
  final String adress;

  PlacesLocation({
    required this.latitude,
    required this.longitude,
    required this.adress,
  });
}
