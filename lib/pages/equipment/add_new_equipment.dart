import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Smarting_AppMenu.dart';

class AddNewEquipment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Container(
          //TODO : 備品の情報を登録する機能の追加
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Text(
                  '備品の情報を登録する機能の追加する予定',
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text('戻る'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              )
            ],
          ),
        )
      )
    );
  }
}