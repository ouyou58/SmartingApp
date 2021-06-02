import 'package:flutter/material.dart';

class TakePicture extends StatefulWidget {

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'カメラ',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
          ),
        ),
        backgroundColor: Colors.black,
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
                  color: Colors.black,
                ),

                //child: Center(child: Image.asset(pic!),),
                height: 750,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              // onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => TakePicture())
              // ),
            ),

          ],
        ),
      ),
    );
  }
}
