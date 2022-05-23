import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInputs extends StatefulWidget {
  const ImageInputs({Key? key, required this.onSelectImage}) : super(key: key);

  final Function onSelectImage;

  @override
  State<ImageInputs> createState() => _ImageInputsState();
}

class _ImageInputsState extends State<ImageInputs> {
  File? _storageImage;

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();

    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    if (imageFile == null) return;

    setState(() {
      _storageImage = File(imageFile.path);
    });

    //Setando diretório no celular através do path_provider
    final appDir = await syspath.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storageImage!.path);
    final savedImage = await _storageImage?.copy('${appDir.path}/${fileName}');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: _storageImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(110),
                  child: Image.file(
                    _storageImage!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
              border: Border.all(width: 2, color: Colors.grey.shade600),
              shape: BoxShape.circle),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _takePicture,
              icon: Icon(
                Icons.camera_alt,
                color: Colors.grey.shade800,
              ),
              label: Text(
                'Tirar foto',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            TextButton.icon(
              onPressed: _takePicture,
              icon: Icon(
                Icons.photo_library,
                color: Colors.grey.shade800,
              ),
              label: Text(
                'Galeria',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ],
        )
      ],
    );
  }
}
