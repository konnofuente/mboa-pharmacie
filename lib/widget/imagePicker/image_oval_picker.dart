import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageOvalPickerWidget extends StatefulWidget {
  final String label;
  final Function(File) onImagePicked;

  ImageOvalPickerWidget({required this.label, required this.onImagePicked});

  @override
  _ImageOvalPickerWidgetState createState() => _ImageOvalPickerWidgetState();
}

class _ImageOvalPickerWidgetState extends State<ImageOvalPickerWidget> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.onImagePicked(_image!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            _image == null
                ? Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.image, size: 40, color: Colors.grey[800]),
                  )
                : ClipOval(
                    child: Image.file(
                      _image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
            Positioned(
              right: 5,
              bottom: 5,
              child: InkWell(
                onTap: _pickImage,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
