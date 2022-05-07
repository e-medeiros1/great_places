import 'package:flutter/widgets.dart';
import 'package:great_places/Models/places.dart';

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
}
