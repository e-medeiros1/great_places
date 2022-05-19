import 'package:flutter/material.dart';
import 'package:great_places/others/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Meus lugares',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          centerTitle: true,
        ),
        body: const Center(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
