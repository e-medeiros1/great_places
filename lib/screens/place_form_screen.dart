import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/others/app_routes.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_inputs.dart';
import 'package:great_places/widgets/location_inputs.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

//TO-DO: Setar a cor tema e separar label do textfield entre normal e onFocused
class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlaces(_titleController.text, _pickedImage!);

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
              const LocationInputs(),
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
                ),
                onPressed: _submitForm,
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
