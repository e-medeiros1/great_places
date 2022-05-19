import 'dart:io';

import 'package:flutter/material.dart';

class ImageInputs extends StatefulWidget {
  const ImageInputs({Key? key}) : super(key: key);

  @override
  State<ImageInputs> createState() => _ImageInputsState();
}

class _ImageInputsState extends State<ImageInputs> {
  File? _storageImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: _storageImage != null
              ? Image.file(
                  _storageImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Text(
                  'Visualização indisponível',
                  softWrap: false,
                  style: TextStyle(color: Colors.grey.shade700),
                )),
          width: 220,
          height: 220,
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey.shade600),
              shape: BoxShape.circle),
        ),
        TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt,
              color: Colors.grey.shade800,
            ),
            label: Text(
              'Tirar foto',
              style: TextStyle(color: Colors.grey.shade600),
            ))
      ],
    );
  }
}
