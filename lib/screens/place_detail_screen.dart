import 'package:flutter/material.dart';
import 'package:great_places/Models/places.dart';
import 'package:great_places/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Places places = ModalRoute.of(context)!.settings.arguments as Places;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // appBar: AppBar(
      //   iconTheme:
      //       IconThemeData(color: Theme.of(context).colorScheme.secondary),
      //   centerTitle: true,
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   elevation: 0,
      //   title: Text(
      //     product.title,
      //     style: TextStyle(
      //       color: Theme.of(context).colorScheme.secondary,
      //       // fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // centerTitle: true,
            expandedHeight: 500,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  places.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                // alignment: Alignment.center,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    places.image,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.6),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                        begin: Alignment(0, 0.8),
                        end: Alignment(0, 0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                places.location!.address.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(isReadOnly: true, initialLocation: places.location!,),
                    
                  ),
                  
                );
                
              },
              icon: const Icon(Icons.map),
              label: const Text('Ver no Mapa'),
              
            ),
            // Chip(
            //   backgroundColor: Theme.of(context).colorScheme.primary,
            //   label: Text(
            //     'R\$ ${p.price}',
            //     style: TextStyle(
            //       fontSize: 25,
            //       color: Theme.of(context).colorScheme.secondary,
            //       // backgroundColor: Colors.black,
            //     ),
            //   ),
            // ),
          ]))
        ],
      ),
    );
  }
}
