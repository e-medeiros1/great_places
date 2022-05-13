import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places/others/app_routes.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meus lugares',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Colors.blueGrey, secondary: Colors.white),
      ),
      home: const PlacesListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
      },
    );
  }
}
