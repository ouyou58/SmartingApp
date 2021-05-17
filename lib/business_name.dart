import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessName extends StatelessWidget {
  //　TODO データベースから取得情報
  int data = 10;

  @override
  Widget build(BuildContext context) {
    if (data == 0) {
      return Center(child: Text("there is nothing"));
    } else {
      return Center(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                // 自定义cell
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Center(child:Image.asset('assets/images/bbbbb.png')),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child:Row(children: [Text("会社:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),Text("スマートアイエンジー株式会社")],)
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child:Row(children: [Text("名前:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),Text("米倉涼子")],)
                  ),
                ],
              );
            }),
      );
    }
  }
}
