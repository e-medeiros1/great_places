import 'package:flutter/material.dart';
import 'package:great_places/others/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus lugares'),
        centerTitle: true,
      ),
      body: const CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
