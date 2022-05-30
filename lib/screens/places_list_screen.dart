import 'package:flutter/material.dart';
import 'package:great_places/others/app_routes.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Meus lugares',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text(
                    'Nenhum lugar cadastrado',
                  ),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch!
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ListTile(
                            style: ListTileStyle.list,
                            onTap: () {},
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  FileImage(greatPlaces.itemsByIndex(i).image),
                            ),
                            title: Text(greatPlaces.itemsByIndex(i).title),
                            // subtitle: Text(greatPlaces
                            //     .itemsByIndex(i)
                            //     .location!
                            //     .adress
                            //     .toString())
                          ),
                        ),
                      ),
              ),
      ),
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
    );
  }
}
