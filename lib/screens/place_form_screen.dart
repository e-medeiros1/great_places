import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_inputs.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

//TO-DO: Setar a cor tema e separar label do textfield entre normal e onFocused
class _PlaceFormScreenState extends State<PlaceFormScreen> {
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
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const ImageInputs(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Título',
                        labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: Text(
                'Adicionar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ));
  }
}
