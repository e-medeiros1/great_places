import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/Models/places.dart';
import 'package:great_places/others/db_util.dart';
import 'package:great_places/others/location_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Places> _items = [];

  //Função responsável por carregar os locais registrados no DB
  Future<void> loadPlaces() async {
    //Pegando a função criada e passando o nome da tabela
    final dataList = await DbUtil.getData('places');
    //Insere dentro da lista de _items[];
    _items = dataList
        .map(
          (item) => Places(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlacesLocation(
              latitude: item['latitude'],
              longitude: item['longitude'],
              address: item['address']
            ),
          ),
        )
        .toList();
    notifyListeners();
  }

  //Clone da lista
  List<Places> get items {
    return [..._items];
  }

  //Para saber a quantidade de items sem precisar clonar a lista
  int get itemsCount {
    return _items.length;
  }

  //Pega o item pelo id
  Places itemsByIndex(int index) {
    return _items[index];
  }

  Future<void> addPlaces(String title, File image, LatLng position) async {
    String address = await LocationUtil.getAddressFrom(position);
    final newPlace = Places(
      id: Random().nextDouble().toString(),
      image: image,
      title: title,
      location: PlacesLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );
    _items.add(newPlace);
    //Antes de notificar os listeners, insere as informações no db
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': address,
    });
    notifyListeners();
  }
}
