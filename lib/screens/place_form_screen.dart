import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_inputs.dart';

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
              IconThemeData(color: Theme.of(context).colorScheme.primary),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            'Cadastro de locais',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const ImageInputs(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
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
                onPressed: () {},
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
                ))
            // TextButton.icon(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.add,
            //     color: Theme.of(context).colorScheme.primary,
            //     size: 24,
            //   ),
            //   label: Text(
            //     'Adicionar',
            //     style: TextStyle(
            //         color: Theme.of(context).colorScheme.primary, fontSize: 17),
            //   ),
            //   style: ButtonStyle(
            //     elevation: MaterialStateProperty.all(0),
            //     // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //   ),
            // )
          ],
        ));
  }
}
