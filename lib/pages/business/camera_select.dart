import 'package:flutter/material.dart';
import 'package:smarting/pages/business/library.dart';
import 'package:smarting/pages/business/camera.dart';
import 'package:smarting/pages/smarting_main.dart';

class CameraSelect extends StatefulWidget {

  @override
  _CameraSelectState createState() => _CameraSelectState();
}

class _CameraSelectState extends State<CameraSelect> {

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
                padding: EdgeInsets.only(top: 20, right: 90, bottom: 20, left: 90),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: Icon(Icons.camera_alt, size: 40.0),
                        title: Text(
                          'カメラ起動',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //child: Center(child: Image.asset(pic!),),
                width: 400,
                height: 100,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraApp())
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20, right: 55, bottom: 20, left: 55),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: Icon(Icons.folder_outlined, size: 40.0),
                        title: Text(
                          'ライブラリーリスト',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //child: Center(child: Image.asset(pic!),),
                width: 400,
                height: 100,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              onTap: () => Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => BusinessCardList())
                  MaterialPageRoute(builder: (context) => Library())
              ),
            ),
          ],
        ),
      ),
    );
  }
}
