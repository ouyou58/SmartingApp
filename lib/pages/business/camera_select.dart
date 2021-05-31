import 'package:flutter/material.dart';
import 'package:smarting/pages/business/take_picture.dart';
import 'package:smarting/pages/business/business_card_list.dart';

class CameraSelect extends StatefulWidget {

  @override
  _CameraSelectState createState() => _CameraSelectState();
}

class _CameraSelectState extends State<CameraSelect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'カメラとリスト',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,

                ),
                child: Column(
                  children: [
                    Text(
                      'カメラ起動',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                //child: Center(child: Image.asset(pic!),),
                width: 400,
                height: 80,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TakePicture())
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,

                ),
                child: Column(
                  children: [
                    Text(
                      'ライブラリーリスト',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                //child: Center(child: Image.asset(pic!),),
                width: 400,
                height: 80,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusinessCardList())
              ),
            ),
          ],
        ),
      ),
    );
  }
}
