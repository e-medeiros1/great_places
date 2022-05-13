import 'package:flutter/material.dart';

class ImageInputs extends StatefulWidget {
  const ImageInputs({Key? key}) : super(key: key);

  @override
  State<ImageInputs> createState() => _ImageInputsState();
}

class _ImageInputsState extends State<ImageInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
