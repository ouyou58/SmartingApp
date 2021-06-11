import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarting/pages/business/add_new_business_card.dart';

// image_gallery_saver
import 'package:image_gallery_saver/image_gallery_saver.dart';

// Uint8List
import 'dart:typed_data';

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.orangeAccent,
      ),
      home: Camera(title: 'アップロード'),
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

  // ture = カメラー　false = ライブラリー
  // ignore: unused_field
  bool _statusFlag = false;

  // カメラ画像の読み込み
  Future getImageFromCamera() async {
    // カメラ
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _statusFlag = true;
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        return;
      }
    });
  }

  // アルバム画像の読み込み
  Future getImageFromGarally() async {
    // アルバム
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _statusFlag = false;
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        return;
      }
    });
  }

  // 画像の保存
  Future _saveImage() async {
    if (_image != null) {
      Uint8List _buffer = await _image!.readAsBytes();
      final result = await ImageGallerySaver.saveImage(_buffer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewBusinessCard())),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(widget.title!),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            onPressed: () => {
              if (_statusFlag) {_saveImage()},
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewBusinessCard()),
              ),
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text(
                    '\u{1F4F7}カメラ\n\u{1F4C2}ライブラリー\n\nアップロードしてください',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  )
                : Image.file(
                    _image!,
                  ),
          ],
        ),
      ),
      floatingActionButton: Row(
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
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
