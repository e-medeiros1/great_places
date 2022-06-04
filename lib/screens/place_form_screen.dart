import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_inputs.dart';
import 'package:great_places/widgets/location_inputs.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
    print(_pickedPosition);
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;

    Provider.of<GreatPlaces>(context, listen: false).addPlaces(
      _titleController.text,
      _pickedImage as File,
      _pickedPosition as LatLng,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.secondary),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Cadastro de locais',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 15),
              ImageInputs(onSelectImage: this._selectImage),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      cursorColor: Colors.black54,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              LocationInputs(onSelectPosition: this._selectPosition),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: _isValidForm() ? _submitForm : null,
                icon: Icon(
                  Icons.add,
                  size: 25,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
