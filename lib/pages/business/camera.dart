import 'dart:io';
import 'dart:async';
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
      else {
        return;
      }
    });
  }

  Future getImageFromGarally() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        return;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
              width: 170.0,
              height: 60.0,
              child: FloatingActionButton.extended(
                onPressed: getImageFromCamera,
                label: const Text(
                  'カメラ',
                  style: TextStyle(
                    letterSpacing: 12,
                    fontSize: 18.0,
                  ),
                ),
                icon: Icon(Icons.photo_camera, size: 40),
                heroTag: null,
                backgroundColor: Colors.orangeAccent.shade100,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
              width: 170.0,
              height: 60.0,
              child: FloatingActionButton.extended(
                onPressed: getImageFromGarally,
                label: const Text(
                    'ライブラリー',
                    style: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 18.0,
                    ),
                ),
                icon: Icon(Icons.photo_album, size: 40),
                heroTag: null,
                backgroundColor: Colors.orange,
              ),
            ),
            // FloatingActionButton.extended(
            //   onPressed: getImageFromCamera,
            //   label: const Text(
            //       'カメラ',
            //       style: TextStyle(
            //           letterSpacing: 12,
            //           fontSize: 18.0,
            //       ),
            //   ),
            //   icon: const Icon(Icons.photo_camera, size: 40),
            //   backgroundColor: Colors.orangeAccent.shade100,
            // ),
            // FloatingActionButton.extended(
            //   onPressed: getImageFromGarally,
            //   label: const Text(
            //       'ライブラリー',
            //       style: TextStyle(
            //           letterSpacing: 0.5,
            //           fontSize: 18.0,
            //       ),
            //   ),
            //   icon: const Icon(Icons.photo_album, size: 40),
            //   backgroundColor: Colors.orange,
            // )
          ]
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}