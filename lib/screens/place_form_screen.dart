import 'package:flutter/material.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          'Cadastro de locais',
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
      body: Container(
        child: Center(child: Text('Formulário')),
      ),
    );
  }
}
