import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:great_places/Models/places.dart';
import 'package:great_places/others/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Places> _items = [];

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

  void addPlaces(String title, File image) {
    final newPlace = Places(
      id: Random().nextDouble().toString(),
      image: image,
      title: title,
      location: null,
    );
    _items.add(newPlace);
    //Antes de notificar os listeners, insere as informações no db
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners();
  }
}
