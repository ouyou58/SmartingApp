import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarting/pages/smarting_main.dart';

void main() {
  runApp(CameraApp());
}

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.orangeAccent,
      ),
      home: Camera(title: 'カメラとリスト'),
    );
  }
}

class Camera extends StatefulWidget {
  Camera({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? _image;
  final imagePicker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromGarally() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationController())
          ),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(widget.title!),
        backgroundColor: Colors.orangeAccent
      ),
      body: Center(
        child: _image == null
            ? Text(
          '\u{1F4F7}カメラ\n\u{1F4C2}ライブラリー\nを選択してください',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600
          ),
        )
          : Image.file(_image!)
      ),
      floatingActionButton:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              onPressed: getImageFromCamera,
              label: const Text(
                  'カメラ',
                  style: TextStyle(
                      letterSpacing: 12,
                      fontSize: 20.0,
                  ),
              ),
              icon: const Icon(Icons.photo_camera, size: 40),
              backgroundColor: Colors.orangeAccent.shade100,
            ),
            FloatingActionButton.extended(
              onPressed: getImageFromGarally,
              label: const Text(
                  'ライブラリー',
                  style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 20.0,
                  ),
              ),
              icon: const Icon(Icons.photo_album, size: 40),
              backgroundColor: Colors.orange,
            )
          ]
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}